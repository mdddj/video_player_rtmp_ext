//
//  VlcPlayer.swift
//  Pods
//
//  Created by ldd on 2025/9/7.
//
// VlcPlayer.swift (or your chosen filename for macOS)

import FlutterMacOS // 注意：在 macOS 上是 FlutterMacOS
import Foundation
import VLCKit

// 1. 遵循 VLCMediaPlayerDelegate 来监听状态
class PluginView: NSView, FlutterStreamHandler, VLCMediaPlayerDelegate {
    
    /// --- 插件相关实例初始化 (与 iOS 保持一致)
    var viewId: Int64
    var flutterMethedChannel: FlutterMethodChannel
    var eventChannel: FlutterEventChannel
    var sink: FlutterEventSink? // 明确为可选类型，更安全
    
    /// --- 播放器实例
   
    var vlcVideoView: VLCVideoView! // 这是真正显示视频画面的 View
    var player: VLCMediaPlayer! // 4. 从 IJK...Controller 改为 VLCMediaPlayer
    
    // 标志位 (与 iOS 保持一致)
    private var isDisposed = false
    private let disposeQueue = DispatchQueue(label: "com.plugin.vlc.dispose", qos: .utility)
    
    /// 构造初始化
    init(registrar: FlutterPluginRegistrar, viewId: Int64) {
        self.viewId = viewId
      
        
        self.flutterMethedChannel = FlutterMethodChannel(name: "video-player-rtmp-ext-\(String(viewId))", binaryMessenger: registrar.messenger)
        self.eventChannel = FlutterEventChannel(name: "video-player-rtmp-ext-event-\(String(viewId))", binaryMessenger: registrar.messenger)
        
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        // 初始化播放器和视图
        wantsLayer = true
        layer?.backgroundColor = NSColor.systemBlue.cgColor
        self.player = VLCMediaPlayer()
        self.vlcVideoView = VLCVideoView(frame: self.bounds)
        self.vlcVideoView.autoresizingMask = [.width, .height]
        
        // --- 关键修正点在这里 ---
        // 告诉 player 对象，它的“画板”是 vlcVideoView
        self.player.drawable = self.vlcVideoView
        // -------------------------
        
        // 设置代理，这样才能收到状态回调
        self.player.delegate = self
        
        // 将 vlcVideoView 添加到我们的根视图中
       
        self.addSubview(self.vlcVideoView)
        
        // 设置方法和事件通道的处理器
        self.flutterMethedChannel.setMethodCallHandler(handle)
        self.eventChannel.setStreamHandler(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
  
    
    /// 注册方法监听
    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print("macOS ========= \(call.method)")
        switch call.method {
        case "init":
            result(true)
        case "init-controller":
            initController(args: call.arguments!, result: result)
        case "init-controller-file":
            playByPath(args: call.arguments!, result: result)
        case "controller-play":
            if player != nil && !isDisposed {
                player.play()
            }
            result(true)
        case "controller-resume":
            if player != nil && !isDisposed {
                player.play()
            }
            result(true)
        case "controller-dispose":
            disposeController(result: result)
        case "controller-pause":
            if player != nil && !isDisposed {
                player.pause()
            }
            result(true)
        case "controller-get-state":
            // 6. API 变化：isPlaying 是属性，不是方法
            let isPlaying = player != nil && !isDisposed ? player.isPlaying : false
            result(isPlaying)
        case "controller-stop":
            if player != nil && !isDisposed {
                player.stop()
            }
            result(true)
        default:
        
            result(FlutterMethodNotImplemented)
        }
    }
    
    /// 安全释放控制器
    func disposeController(result: @escaping FlutterResult) {
        disposeQueue.async { [weak self] in
            guard let self = self, !self.isDisposed else {
                DispatchQueue.main.async { result(true) }
                return
            }
            
            self.isDisposed = true
            
            DispatchQueue.main.async {
                if let player = self.player {
                    player.stop()
                    player.delegate = nil
                    player.drawable = nil // <- 添加这一行，解除绑定
                    self.player = nil
                }
                if let vlcView = self.vlcVideoView {
                    vlcView.removeFromSuperview()
                    self.vlcVideoView = nil
                }
                print("macOS player disposed.")
                result(true)
            }
        }
    }
    
    /// 初始化 VLC 播放器 - 播放网络 URL
    func initController(args: Any, result: @escaping FlutterResult) {
        guard let params = args as? [String: Any], let urlString = params["url"] as? String else {
            result(FlutterError(code: "INVALID_ARGS", message: "URL is required", details: nil))
            return
        }
        
        guard let url = URL(string: urlString) else {
            result(FlutterError(code: "INVALID_URL", message: "Cannot parse URL", details: nil))
            return
        }
        
        player.media = VLCMedia(url: url)

        result(true)
    }
    
    /// 播放本机文件
    func playByPath(args: Any, result: @escaping FlutterResult) {
        guard let params = args as? [String: Any], let filePath = params["url"] as? String else {
            result(FlutterError(code: "INVALID_ARGS", message: "File path is required", details: nil))
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        player.media = VLCMedia(url: url)
        result(true)
    }
    
    // MARK: - FlutterStreamHandler
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        print(" ✅ macOS sink init success!")
        self.sink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print("macOS view on cancel")
        disposeController { _ in
            print("onCancel dispose completed")
        }
        self.sink = nil
        return nil
    }
    
    // MARK: - VLCMediaPlayerDelegate (核心状态监听)
    
    
    func mediaPlayerStateChanged(_ aNotification: Notification) {
        mediaPlayerStateChanged(self.player, to: self.player.state)
    }
    
    func mediaPlayerTimeChanged(_ aNotification: Notification) {
        mediaPlayerStateChanged(self.player,to: self.player.state)
    }
    
    /// 8. 实现代理方法，这是状态监听的核心
    func mediaPlayerStateChanged(_ aPlayer: VLCMediaPlayer, to aState: VLCMediaPlayerState) {
        guard !isDisposed else { return }
        
        print("VLC State Changed: \(aState.rawValue)")
        
        // a. 我们可以将 VLC 的状态映射回 IJK 的状态码，或者自定义一套
        // 这里我们直接发送 VLC 的原始状态码
//        pushData(type: "playbackState", data: aState.rawValue)
        sendEventDataToDart(dataType: "loadState") { s in
            s(["dataType": "sendCallbackEvent","playbackState":aState.rawValue])
        }
        
        // b. 模拟 IJK 的 'isPreparedToPlay'
        if aState == .playing || aState == .paused {
//            pushData(type: "isPreparedToPlay", data: true)
            
            // c. 当准备好播放时，获取并发送视频总时长
            if let duration = player.media?.length.intValue, duration > 0 {
                // VLCTime 的 value 是毫秒，IJK 的 duration 是秒，这里统一为秒
                let duration = Double(duration) / 1000.0
//                pushData(type: "duration", data: Double(duration) / 1000.0)
                sendEventDataToDart(dataType: "data") { s in
                    s(["dataType":"ProgressListener","duration":duration,"progress":0,"secProgress":0,"currentPosition":0])
                }
            }
        } else {
//             pushData(type: "isPreparedToPlay", data: false)
        }
        
        // d. 模拟 IJK 的 'loadState' (可以根据需要进行更精细的映射)
        switch aState {
        case .buffering:
            // 对应 IJKMPMovieLoadState.stalled

            sendEventDataToDart(dataType: "loadState") { s in
                s(["dataType": "sendCallbackEvent","playbackState":2])
            }
        case .playing, .paused:
            // 对应 IJKMPMovieLoadState.playable | IJKMPMovieLoadState.playthroughOK
           
            sendEventDataToDart(dataType: "loadState") { s in
                s(["dataType": "sendCallbackEvent","playbackState":3])
            }
        default:
            break
        }
    }
    

    
    func sendEventDataToDart(dataType: String, send: @escaping (_ s: FlutterEventSink) -> Void){
        guard !isDisposed,let sink = self.sink else {
            if isDisposed {return }
            print("⚠️ ....sink is nil, send data fail")
            return
        }
        DispatchQueue.main.async {
            send(sink)
        }
    }
    
    deinit {
        print("PluginView deinit for macOS")
        if !isDisposed {
            if let player = player {
                player.stop()
                player.delegate = nil
            }
        }
    }
}
