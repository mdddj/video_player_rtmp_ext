package shop.itbug.video_player_rtmp_ext

import android.app.Activity
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import shop.itbug.video_player_rtmp_ext.view.IJKPlayerView

class ViewFactory(private val flutterPluginBinding: FlutterPluginBinding, private val activity: Activity) : PlatformViewFactory(StandardMessageCodec.INSTANCE){


    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return IJKPlayerView(flutterPluginBinding,viewId,activity)
    }
}