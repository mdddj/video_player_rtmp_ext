-keep class com.shuyu.gsyvideoplayer.video.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.video.**
-keep class com.shuyu.gsyvideoplayer.video.base.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.video.base.**
-keep class com.shuyu.gsyvideoplayer.utils.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.utils.**
-keep class com.shuyu.gsyvideoplayer.player.** {*;}
-dontwarn com.shuyu.gsyvideoplayer.player.**
-keep class tv.danmaku.ijk.** { *; }
-dontwarn tv.danmaku.ijk.**
-keep class androidx.media3.** {*;}
-keep interface androidx.media3.**

-keep class com.shuyu.alipay.** {*;}
-keep interface com.shuyu.alipay.**

-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, java.lang.Boolean);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keep class com.alivc.**{*;}
-keep class com.aliyun.**{*;}
-keep class com.cicada.**{*;}
-dontwarn com.alivc.**
-dontwarn com.aliyun.**
-dontwarn com.cicada.**

# Keep Flutter plugin classes
-keep class shop.itbug.video_player_rtmp_ext.VideoPlayerRtmpExtPlugin { *; }
-keep class shop.itbug.video_player_rtmp_ext.ViewFactory { *; }

# Keep all Flutter plugin classes in the package
-keep class shop.itbug.video_player_rtmp_ext.** { *; }

# Suppress warnings for missing classes
-dontwarn shop.itbug.video_player_rtmp_ext.VideoPlayerRtmpExtPlugin

# Suppress warnings for StringConcatFactory used by Kotlin
-dontwarn java.lang.invoke.StringConcatFactory
