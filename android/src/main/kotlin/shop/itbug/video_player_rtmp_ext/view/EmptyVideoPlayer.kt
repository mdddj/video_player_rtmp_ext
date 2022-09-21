package shop.itbug.video_player_rtmp_ext.view

import android.content.Context
import android.util.AttributeSet
import android.view.MotionEvent
import com.shuyu.gsyvideoplayer.video.StandardGSYVideoPlayer
import shop.itbug.video_player_rtmp_ext.R

class EmptyVideoPlayer : StandardGSYVideoPlayer {
    constructor(context: Context): super(context)
    constructor(context: Context,attributeSet: AttributeSet): super(context,attributeSet)

    override fun getLayoutId(): Int {
        return R.layout.empty_video
    }

    override fun touchSurfaceMoveFullLogic(absDeltaX: Float, absDeltaY: Float) {
        super.touchSurfaceMoveFullLogic(absDeltaX, absDeltaY)
        mChangePosition = false
        mChangeVolume = false
        mBrightness = false
    }

    override fun touchDoubleUp(e: MotionEvent?) {
//        super.touchDoubleUp(e)
//
    }
}