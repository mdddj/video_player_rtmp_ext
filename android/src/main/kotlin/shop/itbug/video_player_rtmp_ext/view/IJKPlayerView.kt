package shop.itbug.video_player_rtmp_ext.view

import android.content.Context
import android.net.Uri
import android.util.Log
import android.view.View
import com.shuyu.gsyvideoplayer.builder.GSYVideoOptionBuilder
import com.shuyu.gsyvideoplayer.cache.CacheFactory
import com.shuyu.gsyvideoplayer.cache.ProxyCacheManager
import com.shuyu.gsyvideoplayer.listener.GSYVideoProgressListener
import com.shuyu.gsyvideoplayer.listener.VideoAllCallBack
import com.shuyu.gsyvideoplayer.player.IjkPlayerManager
import com.shuyu.gsyvideoplayer.player.PlayerFactory
import com.shuyu.gsyvideoplayer.player.SystemPlayerManager
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import shop.itbug.video_player_rtmp_ext.model.CustomError
import tv.danmaku.ijk.media.exo2.Exo2PlayerManager
import tv.danmaku.ijk.media.exo2.ExoPlayerCacheManager
import java.io.File

///视图
class IJKPlayerView(
    flutterPluginBinding: FlutterPluginBinding,
    viewId: Int,
    context: Context
) : PlatformView, MethodChannel.MethodCallHandler, VideoAllCallBack, StreamHandler,
    GSYVideoProgressListener {


    private val TAG = "IJKPlayerView"

    private val player: EmptyControlVideo = EmptyControlVideo(context)
    private val option = GSYVideoOptionBuilder()


    private val methedChannel: MethodChannel =
        MethodChannel(flutterPluginBinding.binaryMessenger, "video-player-rtmp-ext-$viewId")
    private var eventChannel: EventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "video-player-rtmp-ext-event-$viewId")


    companion object {
        private var sink: EventChannel.EventSink? = null
    }


    override fun onFlutterViewAttached(flutterView: View) {
        eventChannel.setStreamHandler(this)
        super.onFlutterViewAttached(flutterView)
    }

    init {
        methedChannel.setMethodCallHandler(this)
    }

    override fun getView(): View? {
        return player.rootView
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "init" -> {
                result.success(true)
            }

            "init-controller" -> {
                logger("init play controller : ${call.arguments}")
                initController(call)
                result.success(true)
            }

            ///播放视频
            "controller-play" -> {
                logger("controller play......")
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
            "controller-resume" -> {
                player.onVideoResume()
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


            "controller-dispose" -> {
                ///销毁
                player.release()
                result.success(true)
            }

            ///重置
            "onVideoReset" -> {
                player.onVideoReset()
                result.success(true)
            }

            else -> {
                println("未处理的事件:${call.method}")
                result.notImplemented()
            }
        }

    }

    ///播放本地文件
    private fun playFile(url: String) {
        option.setUrl(url).setVideoAllCallBack(this).build(player)
    }

    ///初始化
    private fun initController(call: MethodCall) {
        val args = call.getParamsMap()
        val url = args["url"]!! as String
        val type = args["type"] as Int
        /// 1-网络文件
        /// 2-本地文件
        if (type == 1) {
            option.setUrl(url).setVideoAllCallBack(this)
                .setGSYVideoProgressListener(this).build(player)
        } else if (type == 2) {
            val path = Uri.fromFile(File(url)).toString()
            option.setUrl(path).setVideoAllCallBack(this).setGSYVideoProgressListener(this)
                .build(player)
        }

    }


    ///视图销毁
    override fun dispose() {
        Log.e(TAG, "视图销毁")
//        player.release()
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

    private fun logger(msg: Any) {
        io.flutter.Log.d("IJKPlayerView", "$msg")
    }

    override fun onStartPrepared(url: String?, vararg objects: Any?) {
        logger("开始准备播放onStartPrepared==$url")
        sendCallbackEvent(1)

    }

    override fun onPrepared(url: String?, vararg objects: Any?) {
        logger("准备播放完成onPrepared==$url")
        sendCallbackEvent(2)
    }

    override fun onClickStartIcon(url: String?, vararg objects: Any?) {
        logger("onClickStartIcon---点击了开始图标:$url")
    }

    override fun onClickStartError(url: String?, vararg objects: Any?) {
        logger("onClickStartError===")
    }

    override fun onClickStop(url: String?, vararg objects: Any?) {
        logger("onClickStop===")
        sendCallbackEvent(0)
    }

    override fun onClickStopFullscreen(url: String?, vararg objects: Any?) {
        logger("onClickStopFullscreen")
        sendCallbackEvent(0)
    }

    override fun onClickResume(url: String?, vararg objects: Any?) {
        logger("onClickResume")
    }

    override fun onClickResumeFullscreen(url: String?, vararg objects: Any?) {
        logger("onClickResumeFullscreen")
    }

    override fun onClickSeekbar(url: String?, vararg objects: Any?) {
        logger("onClickSeekbar")
    }

    override fun onClickSeekbarFullscreen(url: String?, vararg objects: Any?) {
        logger("onClickSeekbarFullscreen")
    }

    override fun onAutoComplete(url: String?, vararg objects: Any?) {
        logger("onAutoComplete")
        sendCallbackEvent(100)

    }

    override fun onComplete(url: String?, vararg objects: Any?) {
        logger("onComplete")

    }

    override fun onEnterFullscreen(url: String?, vararg objects: Any?) {
        logger("onEnterFullscreen")
    }

    override fun onQuitFullscreen(url: String?, vararg objects: Any?) {
        logger("onQuitFullscreen")
    }

    override fun onQuitSmallWidget(url: String?, vararg objects: Any?) {
        logger("onQuitSmallWidget")
    }

    override fun onEnterSmallWidget(url: String?, vararg objects: Any?) {
        logger("onEnterSmallWidget")
    }

    override fun onTouchScreenSeekVolume(url: String?, vararg objects: Any?) {
        logger("onTouchScreenSeekVolume")
    }

    override fun onTouchScreenSeekPosition(url: String?, vararg objects: Any?) {
        logger("onTouchScreenSeekPosition")
    }

    override fun onTouchScreenSeekLight(url: String?, vararg objects: Any?) {
        logger("onTouchScreenSeekLight")
    }

    override fun onPlayError(url: String?, vararg objects: Any?) {
        logger("onPlayError")
        sink?.success(mapOf("dataType" to "onPlayError","error" to objects))
    }

    override fun onClickStartThumb(url: String?, vararg objects: Any?) {
        logger("onClickStartThumb")
    }

    override fun onClickBlank(url: String?, vararg objects: Any?) {
        logger("onClickBlank")
    }

    override fun onClickBlankFullscreen(url: String?, vararg objects: Any?) {
        logger("onClickBlankFullscreen")
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        println("-----init $events")
        sink = events
    }

    override fun onCancel(arguments: Any?) {
    }

    private fun sendCallbackEvent(value: Any) {
        println("$sink  $value")
        sink?.success(mapOf("playbackState" to value, "dataType" to "sendCallbackEvent"))
    }

    override fun onProgress(
        progress: Long,
        secProgress: Long,
        currentPosition: Long,
        duration: Long
    ) {
        sink?.success(
            mapOf(
                "progress" to progress,
                "secProgress" to secProgress,
                "currentPosition" to currentPosition,
                "duration" to duration,
                "dataType" to "ProgressListener"
            )
        )
    }


}

fun MethodCall.getParamsMap(): Map<String, Any> = arguments as Map<String, Any>

fun MethodChannel.Result.returnError(customError: CustomError) {
    error(customError.code, customError.message, null)
}