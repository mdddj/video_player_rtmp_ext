// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_listener_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressListenerModel _$ProgressListenerModelFromJson(
        Map<String, dynamic> json) =>
    ProgressListenerModel(
      progress: json['progress'] as num,
      secProgress: json['secProgress'] as num,
      currentPosition: json['currentPosition'] as num,
      duration: json['duration'] as num,
      $type: json['dataType'] as String?,
    );

Map<String, dynamic> _$ProgressListenerModelToJson(
        ProgressListenerModel instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'secProgress': instance.secProgress,
      'currentPosition': instance.currentPosition,
      'duration': instance.duration,
      'dataType': instance.$type,
    };

StateListenerModel _$StateListenerModelFromJson(Map<String, dynamic> json) =>
    StateListenerModel(
      playbackState: (json['playbackState'] as num).toInt(),
      $type: json['dataType'] as String?,
    );

Map<String, dynamic> _$StateListenerModelToJson(StateListenerModel instance) =>
    <String, dynamic>{
      'playbackState': instance.playbackState,
      'dataType': instance.$type,
    };

OnPlayErrorListenerModel _$OnPlayErrorListenerModelFromJson(
        Map<String, dynamic> json) =>
    OnPlayErrorListenerModel(
      error: json['error'],
      $type: json['dataType'] as String?,
    );

Map<String, dynamic> _$OnPlayErrorListenerModelToJson(
        OnPlayErrorListenerModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'dataType': instance.$type,
    };
