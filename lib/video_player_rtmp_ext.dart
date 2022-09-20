
import 'package:video_player_rtmp_ext/video_player_rtmp_ext_method_channel.dart';


///视频播放器控制器类
class VideoPlayerRtmpExtController {

  final int viewId;
  VideoPlayerRtmpExtController(this.viewId);

 late final channel = MethodChannelVideoPlayerRtmpExt(viewId);

 ///初始化
 Future<void> init() async {
   try{
     await channel.init();
   }catch(e){
     print(e);
   }
 }

 ///初始化控制器
 Future<void> initIJKPlayController(String url) async {
   await channel.initIJKPlayController(url);
 }


 ///播放
 Future<void> play() async {
   await channel.play();
 }

 ///销毁
 void dispose() {
   channel.dispose();
 }
}
