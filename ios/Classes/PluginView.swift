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
    
    // 添加标志位防止重复释放
    private var isDisposed = false
    private let disposeQueue = DispatchQueue(label: "com.plugin.dispose", qos: .utility)
    
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
        case "init-controller-file":
            playByPaht(args: call.arguments!,result: result)
            break
        case "controller-play":
            if controller != nil && !isDisposed {
                controller.play()
            }
            result(true)
            break;
        case "controller-dispose":
            disposeController(result: result)
            break
        case "controller-pause":
            if controller != nil && !isDisposed {
                controller.pause()
            }
            result(true)
            break
        case "controller-get-state":
            let isPlaying = controller != nil && !isDisposed ? controller.isPlaying() : false
            result(isPlaying)
            break
        case "controller-stop":
            if controller != nil && !isDisposed {
                controller.stop()
            }
            result(true)
            break
        default:
            break
        }
    }
    
    ///安全释放控制器
    func disposeController(result: @escaping FlutterResult) {
        disposeQueue.async { [weak self] in
            guard let self = self, !self.isDisposed else {
                DispatchQueue.main.async {
                    result(true)
                }
                return
            }
            
            self.isDisposed = true
            
            DispatchQueue.main.async {
                // 先移除所有通知监听
                self.destoryChangeStateObserver()
                
                if let controller = self.controller {
                    // 如果正在播放，先停止
                    if controller.isPlaying() {
                        controller.stop()
                        print("log: Playing, stop playing...")
                        
                        // 给一点时间让stop完成
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            controller.shutdown()
                            print("start free memory")
                            self.controller = nil
                            result(true)
                        }
                    } else {
                        controller.shutdown()
                        print("start free memory")
                        self.controller = nil
                        result(true)
                    }
                } else {
                    result(true)
                }
            }
        }
    }
    
    ///初始化ijkplayer视图 播放网络URL
    func initController(args: Any,result: @escaping FlutterResult) {
        let params = args as! NSMutableDictionary
        let url = params["url"]
        print("swift===> 参数:\(params.description)")
        if case let url as String = url {
            self.controller = IJKFFMoviePlayerController.init(contentURL: URL.init(string: url), with:IJKFFOptions.byDefault())
            initView()
        }
        result(true)
    }
    
    ///播放本机文件
    func playByPaht(args: Any,result: @escaping FlutterResult) {
        let params = args as! NSMutableDictionary
        if let filePath = params["url"] as? String {
            if #available(iOS 16.0, *) {
                 self.controller = IJKFFMoviePlayerController(contentURL: URL.init(filePath: filePath), with: IJKFFOptions.byDefault())
             } else {
                 self.controller = IJKFFMoviePlayerController(contentURL: URL(fileURLWithPath:filePath), with: IJKFFOptions.byDefault())
             }
             initView()
        }
    }
    
    func initView() {
        let view = controller.view
        view?.frame = self.playerView.frame
        self.playerView.addSubview(view!)
        controller.scalingMode = .aspectFit
        self.initDelegate()
        controller.prepareToPlay()
        self.initChangeStateObserver()
    }
    
    ///初始化监听
    func initDelegate() {
        controller.httpOpenDelegate = self
        controller.tcpOpenDelegate = self
        controller.liveOpenDelegate = self
        controller.segmentOpenDelegate = self
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
            result(true)
        }catch{
            result(false)
        }
    }

    ///监听播放器状态
    func initChangeStateObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange(notif:)), name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object: self.controller)
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange2(notif:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: self.controller)
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange1(notif:)), name: NSNotification.Name.IJKMPMoviePlayerFindStreamInfo, object: self.controller)
        NotificationCenter.default.addObserver(self, selector: #selector(PluginView.didChange3(notif:)), name: NSNotification.Name.IJKMPMediaPlaybackIsPreparedToPlayDidChange, object: self.controller)
    }
    
    ///加载变化回调
    @objc func didChange(notif: Notification) {
        guard !isDisposed else { return }
        let state = controller.loadState
        pushData(type: "loadState", data: state.rawValue)
    }
    @objc func didChange1(notif: Notification){
        guard !isDisposed else { return }
        let state = controller.duration
        pushData(type: "duration", data: state)
    }
    @objc func didChange2(notif: Notification){
        guard !isDisposed else { return }
        let state = controller.playbackState
        pushData(type: "playbackState", data: state.rawValue)
    }
    @objc func didChange3(notif: Notification){
        guard !isDisposed else { return }
        let p = controller.isPreparedToPlay
        pushData(type: "isPreparedToPlay", data: p)
    }
    
    ///销毁全部的监听
    func destoryChangeStateObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        print(" ✅ sink init success!")
        self.sink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print("swift view on cancel")
        
        // 使用统一的释放方法
        disposeController { _ in
            print("onCancel dispose completed")
        }
        
        return nil
    }
    
    ///传输数据到flutter端,flutter端使用一个map来接收和解析数据
    func pushData(type: String,data: Any) {
        guard !isDisposed else { return }
        let map = [type: data]
        if(sink != nil){
            self.sink(map)
        }else{
            print("⚠️ ....sink is nil,send data fail")
        }
    }
    
    // 析构函数确保资源释放
    deinit {
        print("PluginView deinit")
        if !isDisposed {
            destoryChangeStateObserver()
            if let controller = controller, controller.isPlaying() {
                controller.stop()
                controller.shutdown()
            }
        }
    }
}
