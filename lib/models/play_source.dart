import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_source.freezed.dart';

extension PlaySourceEx on PlaySource {
  Map<String,dynamic> get params {
    return switch(this){
      _PlaySourceWithFile(:final file) => {
        "url": file.path,
        "type": 2
      },
      _PlaySourceWithNetwork(:final uri) => {
        "url": uri.toString(),
        "type": 1
      },
    };

  }
}

/// 播放资源类型
@freezed
sealed class PlaySource with _$PlaySource {
  const PlaySource._();

  const factory PlaySource.file({
      required File file,
    }) = _PlaySourceWithFile;

  const factory PlaySource.network({
    required Uri uri,
  }) = _PlaySourceWithNetwork;
  
}

