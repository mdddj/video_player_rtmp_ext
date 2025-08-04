library video_player_rtmp_ext;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:video_player_rtmp_ext/models/android_play_manager.dart';
import 'package:video_player_rtmp_ext/models/play_source.dart';
import 'package:video_player_rtmp_ext/video_player_rtmp_ext_method_channel.dart';

import 'models/video_listener_model.dart';

part 'models/play_state_model.dart';

typedef VideoListenCallback = void Function(VideoListenerModel model);

///视频播放器控制器类
class VideoPlayerRtmpExtController {
  final int viewId;

  VideoPlayerRtmpExtController(this.viewId);

  late final channel = MethodChannelVideoPlayerRtmpExt(viewId);

  StreamSubscription? _stream;

  final List<VideoListenCallback> _listeners = [];

  void addListener(VideoListenCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VideoListenCallback listener) {
    _listeners.remove(listener);
  }

  ///初始化
  Future<void> init() async {
    try {
      await channel.init();
      _stream =
          channel.eventChannel.receiveBroadcastStream().listen(_dataCallback)
            ..onError((e) {
              print('error-->$e');
            })
            ..onDone(() {
              print('done -->');
            });
    } catch (e) {
      print(e);
    }
  }

  ///初始化控制器
  Future<void> initIJKPlayController(PlaySource source) async {
    await channel.initIJKPlayController(source);
  }

  ///播放
  Future<void> play() async {
    await channel.play();
  }

  ///暂停播放
  Future<void> pause() async {
    await channel.pause();
  }

  ///是否正在播放中
  Future<bool> isPlaying() async {
    return await channel.isPlaying();
  }

  ///结束播放
  Future<void> stop() async {
    await channel.stop();
  }

  Future<void> resume() async {
    await channel.resume();
  }

  ///切换播放器内核
  Future<void> changeModel(PlayerFactory playerFactory) async {
    await channel.changeModel(playerFactory);
  }

  ///请求通道方法
  ///使用需要慎重
  ///true 执行成功
  Future<bool> channelCall(String method,
      {Map<String, dynamic>? params}) async {
    final result =
        await channel.methodChannel.invokeMethod<bool>(method, params);
    return result ?? false;
  }

  ///重置(Android独有)
  Future<bool> onVideoReset() async {
    return channelCall("onVideoReset");
  }

  ///销毁
  void dispose() {
    _stream?.cancel();
    channel.dispose();
  }

  void _dataCallback(event) {
    if (event case final Map<Object?, Object?> map when map.isNotEmpty) {
      try {
        final model = VideoListenerModel.fromJson(map.toDynamicMap());
        debugPrint("listener len: ${_listeners.length}");
        for (var element in _listeners) {
          element.call(model);
        }
      } catch (e) {
        debugPrint('convert data fail:$e');
      }
    }
  }
}

extension _MapEx on Map<Object?, Object?> {
  Map<String, dynamic> toDynamicMap() {
    var r = <String, dynamic>{};
    forEach((key, value) {
      if (key != null && value != null) {
        r['$key'] = value;
      }
    });
    return r;
  }
}
