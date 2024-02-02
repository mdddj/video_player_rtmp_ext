part of video_player_rtmp_ext;

enum VideoPlayerState {
  stopped,
  playing,
  paused,
  interrupted,
  seekingForward,
  seekingBackward,
  onAutoComplete,//android 播放完成
  none
}


enum VideoLoadStatus {
  unknown,
  playable,
  playThroughOK,
  stalled
}

extension VideoPlayerStateEx on int {
  VideoPlayerState get videoPlayerState {
    switch (this) {
      case 0:
        return VideoPlayerState.stopped;
      case 1:
        return VideoPlayerState.playing;
      case 2:
        return VideoPlayerState.paused;
      case 3:
        return VideoPlayerState.interrupted;
      case 4:
        return VideoPlayerState.seekingForward;
      case 5:
        return VideoPlayerState.seekingBackward;
      case 100:
        return VideoPlayerState.onAutoComplete;
      default:
        return VideoPlayerState.none;
    }
  }

  VideoLoadStatus get videoLoadStatus {
    switch(this) {
      case 0:
        return VideoLoadStatus.unknown;
      case 1:
        return VideoLoadStatus.playable;
      case 2:
        return VideoLoadStatus.playThroughOK;
      case 3:
        return VideoLoadStatus.stalled;
      default:
        return VideoLoadStatus.unknown;
    }
  }
}
