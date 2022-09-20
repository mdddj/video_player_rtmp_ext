//
//  PluginView.swift
//  video_player_rtmp_ext
//
//  Created by ldd on 2022/9/17.
//
import SwiftUI
import Foundation
import AVFoundation
import IJKMediaFramework


///视图组件
class PluginView: NSObject,FlutterPlatformView{
    
    
    
    
    /// --- 插件相关实例初始化
    var flutterPluginRegistrar: FlutterPluginRegistrar
    var viewId: Int64
    var fram: CGRect
    var flutterMethedChannel: FlutterMethodChannel
    
    
    ///播放器实例
    var playerView: UIView!
    var controller: IJKFFMoviePlayerController!
    
    
    /// 构造初始化
    init(flutterPluginRegistrar: FlutterPluginRegistrar,viewId: Int64,fram: CGRect) {
        
        self.flutterPluginRegistrar = flutterPluginRegistrar
        self.viewId = viewId
        self.fram = fram
        self.flutterMethedChannel = FlutterMethodChannel(name: "video-player-rtmp-ext-\(String(viewId))", binaryMessenger: flutterPluginRegistrar.messenger())
        super.init()
        self.playerView = UIView(frame: fram)
        self.flutterMethedChannel.setMethodCallHandler(handle)
    }
    
    
    /// 视图返回
    func view() -> UIView {
        return playerView!
    }
    
    
    
    
    
    ///注册方法监听
    func handle(_ call: FlutterMethodCall,result: @escaping FlutterResult){
        print("swift ========= \(call.method)")
        switch call.method {
        case "init":
            prerequisitInit(result)
            break
        case "init-controller":
            initController(args: call.arguments!,result: result)
            break
        case "controller-play":
            controller.play()
            break;
        case "controller-dispose":
            controller.shutdown()
            break
        case "controller-pause":
            controller.pause()
            break
        case "controller-get-state":
            let isPlaying =  controller.isPlaying()
            result(isPlaying)
            break
        case "controller-stop":
            controller.stop()
            break
        default:
            break
        }
    }
    
    
    
    ///初始化ijkplayer视图
    func initController(args: Any,result: @escaping FlutterResult) {
        let params = args as! NSMutableDictionary
        let url = params["url"]
        let scalingMode = params["scalingMode"] ?? 0
        let autoPlay = params["auto-play"] ?? false
        print("swift===> 参数:\(params.description)")
        if case let url as String = url {
            self.controller = IJKFFMoviePlayerController.init(contentURL: URL.init(string: url), with:IJKFFOptions.byDefault())
            let view = controller.view
            view?.frame = self.playerView.frame
            self.playerView.addSubview(view!)
            controller.scalingMode = .aspectFit
            controller.prepareToPlay()
        }
        result(true)
    }
    
   
    
    ///初始化(必要的),
    func prerequisitInit(_ result: @escaping FlutterResult) {
        let session = AVAudioSession.sharedInstance()
        do {
            if #available(iOS 10.0, *) {
                try session.setCategory(.playAndRecord,mode: .default,options: [.defaultToSpeaker,.allowBluetooth])
            }else{
                session.perform(NSSelectorFromString("setCategory:withOptions:error:"),
                                with: AVAudioSession.Category.playAndRecord,
                                with: [
                                    AVAudioSession.CategoryOptions.allowBluetooth,
                                    AVAudioSession.CategoryOptions.defaultToSpeaker
                                ])
                try session.setMode(.default)
            }
            try session.setActive(true)
            print("初始化成功")
            result(true)
            
        }catch{
            result(false)
            print("初始化失败")
        }
    }
}
