import 'package:flutter/services.dart';
import 'package:video_player_rtmp_ext/exceptions/exception.dart';

import 'video_player_rtmp_ext_platform_interface.dart';

class MethodChannelVideoPlayerRtmpExt extends VideoPlayerRtmpExtPlatform {

  final int viewId;
  MethodChannelVideoPlayerRtmpExt(this.viewId);

  String get _methodChannelName {
    return 'video-player-rtmp-ext-$viewId';
  }

 late final MethodChannel _methodChannel = MethodChannel(_methodChannelName);

  @override
  Future<void> init() async {
    final r = await _methodChannel.invokeMethod("init");
    if(r==false){
      throw InitException(r.toString());
    }
  }

  @override
  Future<void> initIJKPlayController(String url) async {
    final args = {
      "url":url
    };
    await _methodChannel.invokeMethod('init-controller',args);
  }

  @override
  Future<void> play() async {
    await  _methodChannel.invokeMethod("controller-play");
  }

  @override
  void dispose() {
    _methodChannel.invokeMethod("controller-dispose");
  }

  @override
  Future<void> pause() async {
    _methodChannel.invokeMethod("controller-pause");
  }

  @override
  Future<bool> isPlaying() async {
   return await _methodChannel.invokeMethod("controller-get-state");
  }

  @override
  Future<void> stop() async {
    await _methodChannel.invokeMethod("controller-stop");
  }

}
