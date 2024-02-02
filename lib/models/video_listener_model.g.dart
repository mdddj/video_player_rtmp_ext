// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_listener_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressListenerModelImpl _$$ProgressListenerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProgressListenerModelImpl(
      progress: json['progress'] as int,
      secProgress: json['secProgress'] as int,
      currentPosition: json['currentPosition'] as int,
      duration: json['duration'] as int,
      $type: json['dataType'] as String?,
    );

Map<String, dynamic> _$$ProgressListenerModelImplToJson(
        _$ProgressListenerModelImpl instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'secProgress': instance.secProgress,
      'currentPosition': instance.currentPosition,
      'duration': instance.duration,
      'dataType': instance.$type,
    };

_$StateListenerModelImpl _$$StateListenerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StateListenerModelImpl(
      playbackState: json['playbackState'] as int,
      $type: json['dataType'] as String?,
    );

Map<String, dynamic> _$$StateListenerModelImplToJson(
        _$StateListenerModelImpl instance) =>
    <String, dynamic>{
      'playbackState': instance.playbackState,
      'dataType': instance.$type,
    };
