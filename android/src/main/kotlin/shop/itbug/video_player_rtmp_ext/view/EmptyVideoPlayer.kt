package shop.itbug.video_player_rtmp_ext.view

import android.content.Context
import android.util.AttributeSet
import android.view.MotionEvent
import com.shuyu.gsyvideoplayer.video.StandardGSYVideoPlayer

class EmptyVideoPlayer : StandardGSYVideoPlayer {
    constructor(context: Context): super(context)
    constructor(context: Context,fullFlog: Boolean) : super(context,fullFlog)
    constructor(context: Context,attributeSet: AttributeSet): super(context,attributeSet)


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