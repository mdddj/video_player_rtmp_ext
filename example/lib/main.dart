import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:video_player_rtmp_ext/models/android_play_manager.dart';
import 'package:video_player_rtmp_ext/models/play_source.dart';
import 'package:video_player_rtmp_ext/models/video_listener_model.dart';
import 'package:video_player_rtmp_ext/widget/video_player_rtmp_ext.dart';

const line1 = 'http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear2/prog_index.m3u8';
const line2 = 'rtmp://ns8.indexforce.com/home/mystream';
const line3 = 'rtmp://mobliestream.c3tv.com:554/live/goodtv.sdp';

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
  final IJKPlayerController controller = IJKPlayerController(source: PlaySource.network(uri: Uri.parse(line1)));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: size.width / (size.height - padding.top),
            child: VideoPlayerRtmpExtWidget(
              controller: controller,
              viewCreated: (IJKPlayerController _) async {
                controller.addListener(onStateChange);
                if (controller.isAndroid) {
                  await controller.setPlayManager(PlayerFactory.exo2PlayerManager);
                }
                await controller.play();
              },
            ),
          ),
          Positioned(top: padding.top,left: 0,right: 0,child: Row(
            children: [
              IconButton(onPressed: (){
                openFile().then((value) {
                  print(value);
                });
              }, icon: const Icon(Icons.file_copy))
            ],
          ),),
          Positioned(
              bottom: padding.bottom,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    controller.resume();
                  }, icon: const Icon(Icons.play_arrow, color: Colors.white)),
                  IconButton(
                      onPressed: () {
                        controller.pause();
                      },
                      icon: const Icon(
                        Icons.pause,
                        color: Colors.white,
                      ))
                ],
              ))
        ],
      ),
    );
  }

  Future<void> pause() async {
    await controller.pause();
  }

  Future<void> stop() async {
    await controller.stop();
  }

  Future<void> isPlaying() async {
    final isPlaying = await controller.isPlaying;
  }

  ///player state change callback
  void onStateChange(VideoListenerModel model){
    debugPrint("状态变化 changed: $model");
    model.when(progress: (progress, secProgress, currentPosition, duration) {
      // todo : Playback progress
    }, playbackState: (playbackState) {
      // todo: Playback state
    }, onPlayError: (error) {
      // todo : error callback detail info
    },);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
