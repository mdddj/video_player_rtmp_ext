package shop.itbug.video_player_rtmp_ext.view

import android.app.Activity
import android.content.Context
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import com.shuyu.gsyvideoplayer.builder.GSYVideoOptionBuilder
import com.shuyu.gsyvideoplayer.cache.CacheFactory
import com.shuyu.gsyvideoplayer.cache.ProxyCacheManager
import com.shuyu.gsyvideoplayer.player.IjkPlayerManager
import com.shuyu.gsyvideoplayer.player.PlayerFactory
import com.shuyu.gsyvideoplayer.player.SystemPlayerManager
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import shop.itbug.video_player_rtmp_ext.R
import tv.danmaku.ijk.media.exo2.Exo2PlayerManager
import tv.danmaku.ijk.media.exo2.ExoPlayerCacheManager

///视图
class IJKPlayerView(
    val flutterPluginBinding: FlutterPluginBinding,
    viewId: Int,
    activity: Activity,
    context: Context
) : PlatformView, MethodChannel.MethodCallHandler {


    val TAG = "IJKPlayerView";

    private val player: EmptyVideoPlayer = LayoutInflater.from(context)
        .inflate(R.layout.empty_video, null) as EmptyVideoPlayer
    private val option = GSYVideoOptionBuilder()


    private val methedChannel: MethodChannel =
        MethodChannel(flutterPluginBinding.binaryMessenger, "video-player-rtmp-ext-$viewId")


    ///初始化
    init {
        methedChannel.setMethodCallHandler(this)
    }


    override fun getView(): View? {
        return player.rootView
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        println("进来了:${call.method} ${call.arguments} ")
        when (call.method) {
            "init" -> {
                result.success(true)
            }
            "init-controller" -> {
                initController(call, result)
                result.success(true)
            }
            "controller-play" -> {
                player.startPlayLogic()
                result.success(true)
            }
            "controller-pause" -> {
                player.onVideoPause()
                result.success(true)
            }
            "controller-stop" -> {
                player.onVideoReset()
                result.success(true)
            }
            "android-change-mode" -> {
                changeManager(call)
                result.success(true)
            }
            "controller-get-state" -> {
                val isPlaying = player.isInPlayingState
                result.success(isPlaying)
            }
            else -> {
                println("未处理的事件:${call.method}")
            }
        }

    }

    ///初始化
    private fun initController(call: MethodCall, result: MethodChannel.Result) {
        val args = call.getParamsMap()
        val url = args["url"]!! as String
        option.setUrl(url).build(player)
    }


    ///视图销毁
    override fun dispose() {
        Log.e(TAG, "视图销毁")
    }


    ///切换内核
    private fun changeManager(call: MethodCall) {
        when (call.getParamsMap()["mode"]!! as Int) {
            0 -> {
                PlayerFactory.setPlayManager(Exo2PlayerManager::class.java)
                CacheFactory.setCacheManager(ExoPlayerCacheManager::class.java)
            }
            1 -> {
                PlayerFactory.setPlayManager(SystemPlayerManager::class.java)
                CacheFactory.setCacheManager(ProxyCacheManager::class.java)
            }
            2 -> {
                PlayerFactory.setPlayManager(IjkPlayerManager::class.java)
                CacheFactory.setCacheManager(ProxyCacheManager::class.java)
            }
            else -> {

            }
        }
    }
}

fun MethodCall.getParamsMap(): Map<String, Any> {
    return arguments as Map<String, Any>
}