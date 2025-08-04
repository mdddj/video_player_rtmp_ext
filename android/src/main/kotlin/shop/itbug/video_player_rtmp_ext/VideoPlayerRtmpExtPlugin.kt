package shop.itbug.video_player_rtmp_ext

import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** 插件入口 */
class VideoPlayerRtmpExtPlugin: FlutterPlugin, ActivityAware {

  private lateinit var flutterPluginBinding: FlutterPluginBinding
  private var currentActivity: Activity? = null


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPluginBinding) {
    this.flutterPluginBinding = flutterPluginBinding
  }

  override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
    // 清理资源
    currentActivity = null
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    currentActivity = binding.activity
    flutterPluginBinding.platformViewRegistry.registerViewFactory("video-player-rtmp-widget-android", ViewFactory(flutterPluginBinding, binding.activity))
  }

  override fun onDetachedFromActivityForConfigChanges() {
    currentActivity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    currentActivity = binding.activity
  }

  override fun onDetachedFromActivity() {
    currentActivity = null
  }
}
