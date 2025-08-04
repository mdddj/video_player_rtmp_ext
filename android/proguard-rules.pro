# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# GSYVideoPlayer
-keep class com.shuyu.gsyvideoplayer.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.**

# IJKPlayer
-keep class tv.danmaku.ijk.** { *; }
-dontwarn tv.danmaku.ijk.**

# Flutter
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# 保持插件主类不被混淆
-keep class shop.itbug.video_player_rtmp_ext.VideoPlayerRtmpExtPlugin { *; }

# 保持自定义视图类
-keep class shop.itbug.video_player_rtmp_ext.view.** { *; }

# 保持ViewFactory类
-keep class shop.itbug.video_player_rtmp_ext.ViewFactory { *; }

# 保持所有平台视图相关类
-keep class shop.itbug.video_player_rtmp_ext.** { *; }
