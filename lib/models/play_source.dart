import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_source.freezed.dart';

extension PlaySourceEx on PlaySource {
  Map<String,dynamic> get params {
    return map(file: (value) {
      return {
        "url": value.file.path,
        "type": 2
      };
    }, network: (value) {
      return {
        "url": value.uri.toString(),
        "type": 1
      };
    },);
  }
}

/// 播放资源类型
@freezed
class PlaySource with _$PlaySource {
  const PlaySource._();

  const factory PlaySource.file({
      required File file,
    }) = _PlaySourceWithFile;

  const factory PlaySource.network({
    required Uri uri,
  }) = _PlaySourceWithNetwork;
  
}

