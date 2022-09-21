package shop.itbug.video_player_rtmp_ext

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** 插件入口 */
class VideoPlayerRtmpExtPlugin: FlutterPlugin,ActivityAware {

  private lateinit var flutterPluginBinding: FlutterPluginBinding


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPluginBinding) {
    this.flutterPluginBinding = flutterPluginBinding
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPluginBinding) {

  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    flutterPluginBinding.platformViewRegistry.registerViewFactory("video-player-rtmp-widget-android",ViewFactory(flutterPluginBinding,binding.activity))
  }

  override fun onDetachedFromActivityForConfigChanges() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

  }

  override fun onDetachedFromActivity() {

  }
}
