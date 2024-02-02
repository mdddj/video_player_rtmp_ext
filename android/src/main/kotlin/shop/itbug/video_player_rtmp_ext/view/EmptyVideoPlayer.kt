package shop.itbug.video_player_rtmp_ext.view

import android.content.Context
import android.util.AttributeSet
import android.view.MotionEvent
import com.shuyu.gsyvideoplayer.video.StandardGSYVideoPlayer
import shop.itbug.video_player_rtmp_ext.R


class EmptyControlVideo (context: Context): StandardGSYVideoPlayer(context) {



    override fun init(context: Context?) {
        super.init(context)
        hideAllWidget()
        changeUiToNormal()
    }

    override fun getLayoutId(): Int {
        return R.layout.empty
    }

    override fun touchSurfaceMoveFullLogic(absDeltaX: Float, absDeltaY: Float) {
        super.touchSurfaceMoveFullLogic(absDeltaX, absDeltaY)
        //不给触摸快进，如果需要，屏蔽下方代码即可
        mChangePosition = false

        //不给触摸音量，如果需要，屏蔽下方代码即可
        mChangeVolume = false

        //不给触摸亮度，如果需要，屏蔽下方代码即可
        mBrightness = false
    }

    override fun touchDoubleUp(e: MotionEvent) {
        //super.touchDoubleUp();
        //不需要双击暂停
    }
}