import Cocoa
import FlutterMacOS

public class VideoPlayerRtmpExtPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "video_player_rtmp_ext", binaryMessenger: registrar.messenger)
    let instance = VideoPlayerRtmpExtPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
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
