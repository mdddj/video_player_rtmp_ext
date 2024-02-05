import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/android_play_manager.dart';
import '../models/play_source.dart';
import '../video_player_rtmp_ext.dart';

const _UIKITVIEW_ID = 'video-player-rtmp-widget-ios';
const _ANDROIDVIEW_ID = 'video-player-rtmp-widget-android';

typedef ViewCreated = void Function(IJKPlayerController controller);

typedef CallUI = void Function();

///小部件
class VideoPlayerRtmpExtWidget extends StatefulWidget {
  final IJKPlayerController controller;
  final Widget? initWidget;
  final ViewCreated? viewCreated;
  final ValueChanged<VideoPlayerState>? stateChanged;
  final ValueChanged<VideoLoadStatus>? loadStatusChanged;

  const VideoPlayerRtmpExtWidget({Key? key, this.initWidget, this.viewCreated, required this.controller, this.stateChanged, this.loadStatusChanged}) : super(key: key);

  @override
  State<VideoPlayerRtmpExtWidget> createState() => VideoPlayerRtmpExtWidgetState();
}

class VideoPlayerRtmpExtWidgetState extends State<VideoPlayerRtmpExtWidget> {
  late VideoPlayerRtmpExtController _platformController;

  ///操作原生的通道
  IJKPlayerController get controller => widget.controller;

  @override
  void initState() {
    _bindController();
    super.initState();
  }

  ///处理监听
  void _handleEvent(dynamic data) {
    if (data is Map) {
      final state = data['playbackState'];
      if (state is int) {
        widget.stateChanged?.call(state.videoPlayerState);
      }
      final status = data['loadState'];
      if (status is int) {
        widget.loadStatusChanged?.call(status.videoLoadStatus);
      }
    }
  }

  @override
  void didUpdateWidget(covariant VideoPlayerRtmpExtWidget oldWidget) {
    if (widget.controller != oldWidget.controller) {
      _bindController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return coreWidget;
  }

  Widget get coreWidget {
    if (Platform.isAndroid) {
      return _buildAndroidWidget;
    } else if (Platform.isIOS) {
      return _buildIosWidget;
    }
    return const Text('This platform is not supported');
  }

  ///ios端视图
  Widget get _buildIosWidget {
    return UiKitView(viewType: _UIKITVIEW_ID, onPlatformViewCreated: _platformSetup);
  }

  ///安卓端视图
  Widget get _buildAndroidWidget {
    return AndroidView(viewType: _ANDROIDVIEW_ID, onPlatformViewCreated: _platformSetup);
  }

  ///视图创建完毕
  Future<void> _platformSetup(int id) async {
    _platformController = VideoPlayerRtmpExtController(id);
    await _init();
    widget.viewCreated?.call(widget.controller);
  }

  ///初始化准备工作
  Future<void> _init() async {
    await _platformController.init();
    await _platformController.initIJKPlayController(controller.source);
  }

  ///绑定外部控制器
  void _bindController() {
    widget.controller._bindState(this);
  }

  ///开始播放视屏
  Future<void> play() async {
    await _platformController.play();
  }

  @override
  void dispose() {
    _platformController.dispose();
    super.dispose();
  }

}

///播放控制器
class IJKPlayerController {
  final PlaySource source;

  IJKPlayerController({required this.source});

  late VideoPlayerRtmpExtWidgetState state;

  void _bindState(VideoPlayerRtmpExtWidgetState _viewState) {
    state = _viewState;
  }

  ///暂停播放
  Future<void> pause() async {
    await state._platformController.pause();
  }

  ///开始播放
  Future<void> play() async {
    await state.play();
  }

  ///恢复播放.
  Future<void> resume() async {
    await state._platformController.resume();
  }

  ///结束播放
  Future<void> stop() async {
    await state._platformController.stop();
  }

  ///是否正在播放中
  Future<bool> get isPlaying async => await state._platformController.isPlaying();

  /// 切换内核
  /// only android
  Future<void> setPlayManager(PlayerFactory playerFactory) async {
    await state._platformController.changeModel(playerFactory);
  }

  ///重置
  Future<bool> onVideoReset() async {
    return state._platformController.onVideoReset();
  }

  bool get isAndroid => Platform.isAndroid;

  void addListener(VideoListenCallback listener){
    state._platformController.addListener(listener);
  }

  void removeListener(VideoListenCallback listener){
    state._platformController.removeListener(listener);
  }
}
