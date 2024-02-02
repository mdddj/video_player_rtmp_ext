import 'package:flutter/material.dart';
import 'package:video_player_rtmp_ext/models/android_play_manager.dart';
import 'package:video_player_rtmp_ext/models/play_source.dart';
import 'package:video_player_rtmp_ext/widget/video_player_rtmp_ext.dart';

const line1 =
    'http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear2/prog_index.m3u8';
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
      appBar: AppBar(title: const Text("live broadcase")),
      body: AspectRatio(
        aspectRatio: size.width / (size.height - kToolbarHeight - padding.top),
        child: VideoPlayerRtmpExtWidget(
          controller: controller,
          viewCreated: (IJKPlayerController _) async {
            controller.addListener((model) {
              print(model);
            });
            if (controller.isAndroid) {
              await controller.setPlayManager(PlayerFactory.exo2PlayerManager);
            }
            await controller.play();

          },
        ),
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

  @override
  void dispose() {
    super.dispose();
  }
}
