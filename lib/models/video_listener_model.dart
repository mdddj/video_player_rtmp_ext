import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_listener_model.freezed.dart';

part 'video_listener_model.g.dart';

@Freezed(unionKey: "dataType")
sealed class VideoListenerModel with _$VideoListenerModel {
  const VideoListenerModel._();

  @FreezedUnionValue("ProgressListener")
  const factory VideoListenerModel.progress(
      {required int progress,
      required int secProgress,
      required int currentPosition,
      required int duration}) = ProgressListenerModel;

  @FreezedUnionValue('sendCallbackEvent')
  const factory VideoListenerModel.playbackState({required int playbackState}) =
      StateListenerModel;

  @FreezedUnionValue("onPlayError")
  const factory VideoListenerModel.onPlayError({Object? error}) =
      OnPlayErrorListenerModel;

  factory VideoListenerModel.fromJson(dynamic json) =>
      _$VideoListenerModelFromJson(json);
}
