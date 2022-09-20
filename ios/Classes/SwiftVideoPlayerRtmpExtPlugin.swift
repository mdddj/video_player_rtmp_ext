import Flutter
import UIKit

public class SwiftVideoPlayerRtmpExtPlugin: NSObject, FlutterPlugin {
    
  ///注册iOS插件
  public static func register(with registrar: FlutterPluginRegistrar) {
    registrar.register(PluginFactory(flutterPluginRegistrar: registrar), withId: "video-player-rtmp-widget-ios")
  }
 
}
