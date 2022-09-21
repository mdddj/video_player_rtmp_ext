package shop.itbug.video_player_rtmp_ext.view

import android.app.Activity
import android.content.Context
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import com.shuyu.gsyvideoplayer.builder.GSYVideoOptionBuilder
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import shop.itbug.video_player_rtmp_ext.R

///视图
class IJKPlayerView(val flutterPluginBinding: FlutterPluginBinding,viewId: Int,activity: Activity,context: Context): PlatformView,MethodChannel.MethodCallHandler {


    val TAG = "IJKPlayerView";

    private val player : EmptyVideoPlayer = LayoutInflater.from(context)
        .inflate(R.layout.empty_video,null) as EmptyVideoPlayer
    private val option = GSYVideoOptionBuilder()


    private val methedChannel: MethodChannel = MethodChannel(flutterPluginBinding.binaryMessenger,"video-player-rtmp-ext-$viewId")


    ///初始化
    init {
        methedChannel.setMethodCallHandler(this)
    }


    override fun getView(): View? {
        return player.rootView
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        when(call.method){
            "init-controller" -> {
                initController(call,result)
            }
            else -> {
                println("未处理的事件")
            }
        }
    }

    ///初始化
    fun initController(call: MethodCall, result: MethodChannel.Result) {
        val args = call.arguments  as Map<String,Any>
        val url =  args["url"]!! as String
        Log.e(TAG,"播放地址:$url")
        option.setUrl(url).build(player)
    }


    ///视图销毁
    override fun dispose() {
        Log.e(TAG,"视图销毁")
    }
}