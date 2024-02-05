import 'dart:async';

import 'package:flutter/services.dart';
import 'package:video_player_rtmp_ext/exceptions/exception.dart';
import 'package:video_player_rtmp_ext/models/android_play_manager.dart';
import 'package:video_player_rtmp_ext/models/play_source.dart';

import 'video_player_rtmp_ext_platform_interface.dart';

class MethodChannelVideoPlayerRtmpExt extends VideoPlayerRtmpExtPlatform {
  final int viewId;

  MethodChannelVideoPlayerRtmpExt(this.viewId);

  late final String _methodChannelName = 'video-player-rtmp-ext-$viewId';
  late final String _eventChannelName = 'video-player-rtmp-ext-event-$viewId';

  late final MethodChannel _methodChannel = MethodChannel(_methodChannelName);
  late final EventChannel _eventChannel = EventChannel(_eventChannelName);

  EventChannel get eventChannel => _eventChannel;

  MethodChannel get methodChannel => _methodChannel;

  @override
  Future<void> init() async {
    final r = await _methodChannel.invokeMethod("init");
    if (r == false) {
      throw InitException(r.toString());
    }
  }

  @override
  Future<void> initIJKPlayController(PlaySource source) async {
    await _methodChannel.invokeMethod('init-controller', source.params);
  }

  @override
  Future<void> play() async {
    await _methodChannel.invokeMethod("controller-play");
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

  @override
  Future<void> changeModel(PlayerFactory playerFactory) async {
    await _methodChannel.invokeMethod("android-change-mode", {"mode": playerFactory.mode});
  }

  @override
  Future<void> resume() async {
    await _methodChannel.invokeMethod("controller-resume");
  }
}
