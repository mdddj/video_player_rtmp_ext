import Cocoa
import FlutterMacOS

public class VideoPlayerRtmpExtPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "video_player_rtmp_ext", binaryMessenger: registrar.messenger)
    let instance = VideoPlayerRtmpExtPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
      
      let viewFactory = PlayerFlutterViewFactory(register:  registrar)
      registrar.register(viewFactory, withId: "video-player-rtmp-widget-macos")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}



class PlayerFlutterViewFactory: NSObject,FlutterPlatformViewFactory {
    
    private var register : FlutterPluginRegistrar
    
    init(register: FlutterPluginRegistrar) {
        self.register = register
        super.init()
    }
    
    func create(withViewIdentifier viewId: Int64, arguments args: Any?) -> NSView {
        let pluginView = PluginView(registrar: register, viewId: viewId)
        return pluginView
    }
    
    
    func createArgsCodec() -> (any FlutterMessageCodec & NSObjectProtocol)? {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
