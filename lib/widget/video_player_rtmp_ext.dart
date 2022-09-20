

import 'dart:io';

import 'package:flutter/cupertino.dart';

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
  const VideoPlayerRtmpExtWidget({Key? key, this.initWidget, this.viewCreated, required this.controller}) : super(key: key);


  @override
  State<VideoPlayerRtmpExtWidget> createState() => _VideoPlayerRtmpExtWidgetState();
}

class _VideoPlayerRtmpExtWidgetState extends State<VideoPlayerRtmpExtWidget> {

  late VideoPlayerRtmpExtController _platformController; ///操作原生的通道
  IJKPlayerController get controller => widget.controller;
  bool _inited = false;


  @override
  void initState() {
    _bindController();
    super.initState();
  }


  @override
  void didUpdateWidget(covariant VideoPlayerRtmpExtWidget oldWidget) {
    if(widget.controller != oldWidget.controller){
      _bindController();
    }
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    return coreWidget;
  }

  Widget get coreWidget{
    if(Platform.isAndroid){
      return _buildAndroidWidget;
    }else if(Platform.isIOS){
      return _buildIosWidget;
    }
    return const Text('This platform is not supported');
  }


  ///ios端视图
  Widget get _buildIosWidget {
    print('构建iOS视图中....');
    return UiKitView(viewType: _UIKITVIEW_ID,onPlatformViewCreated: _platformSetup);
  }

  ///安卓端视图
  Widget get _buildAndroidWidget {
    return AndroidView(viewType:_ANDROIDVIEW_ID,onPlatformViewCreated: _platformSetup );
  }

  ///视图创建完毕
  Future<void> _platformSetup(int id)  async {
    _platformController = VideoPlayerRtmpExtController(id);
    await _init();
    widget.viewCreated?.call(widget.controller);
    _refreshUi(()=>_inited = true);
  }

  ///初始化准备工作
  Future<void> _init() async {
   await _platformController.init();
   if(controller.playUrl!=null){
     await _platformController.initIJKPlayController(controller.playUrl!);
   }

  }

  ///刷新UI
  void _refreshUi(CallUI call){
    if(mounted){
      setState(call);
    }
  }

  ///绑定外部控制器
  void _bindController(){
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

  ///将要播放的URL
  final String? playUrl;

  IJKPlayerController({this.playUrl});

  late _VideoPlayerRtmpExtWidgetState state;
  void _bindState(_VideoPlayerRtmpExtWidgetState _viewState) {
    state = _viewState;
  }

  ///播放一个网络资源的视频
  factory IJKPlayerController.network(String url) {
    return IJKPlayerController(playUrl: url);
  }

  ///暂停播放
  Future<void> pause() async {
    await state._platformController.pause();
  }

  ///开始播放
  Future<void> play() async {
    await state.play();
  }

  ///结束播放
  Future<void> stop() async {
    await state._platformController.stop();
  }
  ///是否正在播放中
  Future<bool> get isPlaying async =>  await state._platformController.isPlaying();

}