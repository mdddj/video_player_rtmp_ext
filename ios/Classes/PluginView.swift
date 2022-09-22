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
class PluginView: NSObject,FlutterPlatformView,FlutterStreamHandler,IJKMediaUrlOpenDelegate{
    
    func willOpenUrl(_ urlOpenData: IJKMediaUrlOpenData!) {
        print("url 回调: \(urlOpenData.error)")
    }
    
   
    
    
    
    
    
    /// --- 插件相关实例初始化
    var flutterPluginRegistrar: FlutterPluginRegistrar
    var viewId: Int64
    var fram: CGRect
    var flutterMethedChannel: FlutterMethodChannel
    var eventChannel: FlutterEventChannel
    var sink: FlutterEventSink!
    
    
    ///播放器实例
    var playerView: UIView!
    var controller: IJKFFMoviePlayerController!
    
    
    /// 构造初始化
    init(flutterPluginRegistrar: FlutterPluginRegistrar,viewId: Int64,fram: CGRect) {
        
        self.flutterPluginRegistrar = flutterPluginRegistrar
        self.viewId = viewId
        self.fram = fram
        self.flutterMethedChannel = FlutterMethodChannel(name: "video-player-rtmp-ext-\(String(viewId))", binaryMessenger: flutterPluginRegistrar.messenger())
        self.eventChannel = FlutterEventChannel(name: "video-player-rtmp-ext-event-\(String(viewId))", binaryMessenger: flutterPluginRegistrar.messenger())
        super.init()
        self.playerView = UIView(frame: fram)
        self.flutterMethedChannel.setMethodCallHandler(handle)
        self.eventChannel.setStreamHandler(self)
        
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
            result(true)
            break;
        case "controller-dispose":
            controller.shutdown()
            result(true)
            break
        case "controller-pause":
            controller.pause()
            result(true)
            break
        case "controller-get-state":
            let isPlaying =  controller.isPlaying()
            result(isPlaying)
            break
        case "controller-stop":
            controller.stop()
            result(true)
            break
        default:
            break
        }
    }
    
    
    
    ///初始化ijkplayer视图
    func initController(args: Any,result: @escaping FlutterResult) {
        let params = args as! NSMutableDictionary
        let url = params["url"]
        print("swift===> 参数:\(params.description)")
        if case let url as String = url {
            self.controller = IJKFFMoviePlayerController.init(contentURL: URL.init(string: url), with:IJKFFOptions.byDefault())
            let view = controller.view
            view?.frame = self.playerView.frame
            self.playerView.addSubview(view!)
            controller.scalingMode = .aspectFit
            controller.httpOpenDelegate = self
            controller.tcpOpenDelegate = self
            controller.liveOpenDelegate = self
            controller.segmentOpenDelegate = self
            controller.prepareToPlay()
            self.initChangeStateObserver()
        
            
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

    ///监听播放器状态
    func initChangeStateObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange(notif:)), name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object:  self.controller)
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange2(notif:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: self.controller)
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange2(notif:)), name: NSNotification.Name.IJKMPMoviePlayerFindStreamInfo, object: self.controller)
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange3(notif:)), name: NSNotification.Name.IJKMPMediaPlaybackIsPreparedToPlayDidChange, object: self.controller)
    }
    
    ///加载变化回调
    @objc func didChange(notif: Notification) {
        let state = controller.loadState
        print("变化监听State:  \(state)")
        pushData(type: "loadState", data: state.rawValue)
    }
    
    @objc func didChange2(notif: Notification){
        let state = controller.playbackState
        print("变化了回调:\(state)")
        pushData(type: "playbackState", data: state.rawValue)
    }
    @objc func didChange3(notif: Notification){
        let p =  controller.isPreparedToPlay
        print("变化3:::\(p)")
    }
    
    ///销毁全部的监听
    func destoryChangeStateObserver() {
        if(controller.isPlaying()){
            controller.shutdown()
        }
        NotificationCenter.default.removeObserver(self)
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.sink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        destoryChangeStateObserver()
        return nil
    }
    
    ///传输数据到flutter端,flutter端使用一个map来接收和解析数据
    func pushData(type: String,data: Any) {
        let map = [type: data]
        guard sink != nil else {
            print("通道为null,无法传输数据")
            return
        }
        sink(map)
    }
}
