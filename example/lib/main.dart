import 'package:dd_js_util/ext/context.dart';
import 'package:dd_js_util/util/log.dart';
import 'package:flutter/material.dart';
import 'package:video_player_rtmp_ext/models/android_play_manager.dart';
import 'package:video_player_rtmp_ext/widget/video_player_rtmp_ext.dart';

void main() {
  runApp(const MaterialApp(
    home: LiveBroascasePage(),
  ));
}

///直播测试页面
class LiveBroascasePage extends StatefulWidget {
  const LiveBroascasePage({Key? key}) : super(key: key);

  @override
  State<LiveBroascasePage> createState() => _LiveBroascasePageState();
}

class _LiveBroascasePageState extends State<LiveBroascasePage> {
  final playerUrl =
      "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear2/prog_index.m3u8";
   final IJKPlayerController controller =
      IJKPlayerController.network("http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear2/prog_index.m3u8");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("live broadcase")),
      body: AspectRatio(
        aspectRatio: context.screenWidth / context.kBodyHeight,
        child: VideoPlayerRtmpExtWidget(
          controller: controller,
          viewCreated: (IJKPlayerController _) async {
            if(controller.isAndroid){
              await controller.setPlayManager(PlayerFactory.exo2PlayerManager);
            }

           await controller.play();
          },
        ),
      ),
    );
  }

  Future<void> pause() async  {
   await controller.pause();
  }

  Future<void> stop() async {
    await controller.stop();
  }

  Future<void> isPlaying() async {
   final isPlaying =  await controller.isPlaying;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
