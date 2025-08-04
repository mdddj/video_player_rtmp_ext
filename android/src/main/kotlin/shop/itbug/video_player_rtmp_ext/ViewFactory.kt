package shop.itbug.video_player_rtmp_ext

import android.app.Activity
import android.content.Context
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import shop.itbug.video_player_rtmp_ext.view.IJKPlayerView

class ViewFactory(private val flutterPluginBinding: FlutterPluginBinding, private val activity: Activity) : PlatformViewFactory(StandardMessageCodec.INSTANCE){
    private val TAG = "ViewFactory"
    
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        try {
            return IJKPlayerView(flutterPluginBinding, viewId, context!!)
        } catch (e: Exception) {
            Log.e(TAG, "创建IJKPlayerView时出错: ${e.message}")
            throw e
        }
    }
}
