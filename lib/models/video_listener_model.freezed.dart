// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_listener_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoListenerModel _$VideoListenerModelFromJson(Map<String, dynamic> json) {
  switch (json['dataType']) {
    case 'ProgressListener':
      return ProgressListenerModel.fromJson(json);
    case 'sendCallbackEvent':
      return StateListenerModel.fromJson(json);
    case 'onPlayError':
      return OnPlayErrorListenerModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'dataType', 'VideoListenerModel',
          'Invalid union type "${json['dataType']}"!');
  }
}

/// @nodoc
mixin _$VideoListenerModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int progress, int secProgress, int currentPosition, int duration)
        progress,
    required TResult Function(int playbackState) playbackState,
    required TResult Function(Object? error) onPlayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult? Function(int playbackState)? playbackState,
    TResult? Function(Object? error)? onPlayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult Function(int playbackState)? playbackState,
    TResult Function(Object? error)? onPlayError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProgressListenerModel value) progress,
    required TResult Function(StateListenerModel value) playbackState,
    required TResult Function(OnPlayErrorListenerModel value) onPlayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProgressListenerModel value)? progress,
    TResult? Function(StateListenerModel value)? playbackState,
    TResult? Function(OnPlayErrorListenerModel value)? onPlayError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressListenerModel value)? progress,
    TResult Function(StateListenerModel value)? playbackState,
    TResult Function(OnPlayErrorListenerModel value)? onPlayError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoListenerModelCopyWith<$Res> {
  factory $VideoListenerModelCopyWith(
          VideoListenerModel value, $Res Function(VideoListenerModel) then) =
      _$VideoListenerModelCopyWithImpl<$Res, VideoListenerModel>;
}

/// @nodoc
class _$VideoListenerModelCopyWithImpl<$Res, $Val extends VideoListenerModel>
    implements $VideoListenerModelCopyWith<$Res> {
  _$VideoListenerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProgressListenerModelImplCopyWith<$Res> {
  factory _$$ProgressListenerModelImplCopyWith(
          _$ProgressListenerModelImpl value,
          $Res Function(_$ProgressListenerModelImpl) then) =
      __$$ProgressListenerModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress, int secProgress, int currentPosition, int duration});
}

/// @nodoc
class __$$ProgressListenerModelImplCopyWithImpl<$Res>
    extends _$VideoListenerModelCopyWithImpl<$Res, _$ProgressListenerModelImpl>
    implements _$$ProgressListenerModelImplCopyWith<$Res> {
  __$$ProgressListenerModelImplCopyWithImpl(_$ProgressListenerModelImpl _value,
      $Res Function(_$ProgressListenerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? secProgress = null,
    Object? currentPosition = null,
    Object? duration = null,
  }) {
    return _then(_$ProgressListenerModelImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      secProgress: null == secProgress
          ? _value.secProgress
          : secProgress // ignore: cast_nullable_to_non_nullable
              as int,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressListenerModelImpl extends ProgressListenerModel {
  const _$ProgressListenerModelImpl(
      {required this.progress,
      required this.secProgress,
      required this.currentPosition,
      required this.duration,
      final String? $type})
      : $type = $type ?? 'ProgressListener',
        super._();

  factory _$ProgressListenerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressListenerModelImplFromJson(json);

  @override
  final int progress;
  @override
  final int secProgress;
  @override
  final int currentPosition;
  @override
  final int duration;

  @JsonKey(name: 'dataType')
  final String $type;

  @override
  String toString() {
    return 'VideoListenerModel.progress(progress: $progress, secProgress: $secProgress, currentPosition: $currentPosition, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressListenerModelImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.secProgress, secProgress) ||
                other.secProgress == secProgress) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, progress, secProgress, currentPosition, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressListenerModelImplCopyWith<_$ProgressListenerModelImpl>
      get copyWith => __$$ProgressListenerModelImplCopyWithImpl<
          _$ProgressListenerModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int progress, int secProgress, int currentPosition, int duration)
        progress,
    required TResult Function(int playbackState) playbackState,
    required TResult Function(Object? error) onPlayError,
  }) {
    return progress(this.progress, secProgress, currentPosition, duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult? Function(int playbackState)? playbackState,
    TResult? Function(Object? error)? onPlayError,
  }) {
    return progress?.call(
        this.progress, secProgress, currentPosition, duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult Function(int playbackState)? playbackState,
    TResult Function(Object? error)? onPlayError,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this.progress, secProgress, currentPosition, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProgressListenerModel value) progress,
    required TResult Function(StateListenerModel value) playbackState,
    required TResult Function(OnPlayErrorListenerModel value) onPlayError,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProgressListenerModel value)? progress,
    TResult? Function(StateListenerModel value)? playbackState,
    TResult? Function(OnPlayErrorListenerModel value)? onPlayError,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressListenerModel value)? progress,
    TResult Function(StateListenerModel value)? playbackState,
    TResult Function(OnPlayErrorListenerModel value)? onPlayError,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressListenerModelImplToJson(
      this,
    );
  }
}

abstract class ProgressListenerModel extends VideoListenerModel {
  const factory ProgressListenerModel(
      {required final int progress,
      required final int secProgress,
      required final int currentPosition,
      required final int duration}) = _$ProgressListenerModelImpl;
  const ProgressListenerModel._() : super._();

  factory ProgressListenerModel.fromJson(Map<String, dynamic> json) =
      _$ProgressListenerModelImpl.fromJson;

  int get progress;
  int get secProgress;
  int get currentPosition;
  int get duration;
  @JsonKey(ignore: true)
  _$$ProgressListenerModelImplCopyWith<_$ProgressListenerModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StateListenerModelImplCopyWith<$Res> {
  factory _$$StateListenerModelImplCopyWith(_$StateListenerModelImpl value,
          $Res Function(_$StateListenerModelImpl) then) =
      __$$StateListenerModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int playbackState});
}

/// @nodoc
class __$$StateListenerModelImplCopyWithImpl<$Res>
    extends _$VideoListenerModelCopyWithImpl<$Res, _$StateListenerModelImpl>
    implements _$$StateListenerModelImplCopyWith<$Res> {
  __$$StateListenerModelImplCopyWithImpl(_$StateListenerModelImpl _value,
      $Res Function(_$StateListenerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playbackState = null,
  }) {
    return _then(_$StateListenerModelImpl(
      playbackState: null == playbackState
          ? _value.playbackState
          : playbackState // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateListenerModelImpl extends StateListenerModel {
  const _$StateListenerModelImpl(
      {required this.playbackState, final String? $type})
      : $type = $type ?? 'sendCallbackEvent',
        super._();

  factory _$StateListenerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateListenerModelImplFromJson(json);

  @override
  final int playbackState;

  @JsonKey(name: 'dataType')
  final String $type;

  @override
  String toString() {
    return 'VideoListenerModel.playbackState(playbackState: $playbackState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateListenerModelImpl &&
            (identical(other.playbackState, playbackState) ||
                other.playbackState == playbackState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, playbackState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateListenerModelImplCopyWith<_$StateListenerModelImpl> get copyWith =>
      __$$StateListenerModelImplCopyWithImpl<_$StateListenerModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int progress, int secProgress, int currentPosition, int duration)
        progress,
    required TResult Function(int playbackState) playbackState,
    required TResult Function(Object? error) onPlayError,
  }) {
    return playbackState(this.playbackState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult? Function(int playbackState)? playbackState,
    TResult? Function(Object? error)? onPlayError,
  }) {
    return playbackState?.call(this.playbackState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult Function(int playbackState)? playbackState,
    TResult Function(Object? error)? onPlayError,
    required TResult orElse(),
  }) {
    if (playbackState != null) {
      return playbackState(this.playbackState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProgressListenerModel value) progress,
    required TResult Function(StateListenerModel value) playbackState,
    required TResult Function(OnPlayErrorListenerModel value) onPlayError,
  }) {
    return playbackState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProgressListenerModel value)? progress,
    TResult? Function(StateListenerModel value)? playbackState,
    TResult? Function(OnPlayErrorListenerModel value)? onPlayError,
  }) {
    return playbackState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressListenerModel value)? progress,
    TResult Function(StateListenerModel value)? playbackState,
    TResult Function(OnPlayErrorListenerModel value)? onPlayError,
    required TResult orElse(),
  }) {
    if (playbackState != null) {
      return playbackState(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StateListenerModelImplToJson(
      this,
    );
  }
}

abstract class StateListenerModel extends VideoListenerModel {
  const factory StateListenerModel({required final int playbackState}) =
      _$StateListenerModelImpl;
  const StateListenerModel._() : super._();

  factory StateListenerModel.fromJson(Map<String, dynamic> json) =
      _$StateListenerModelImpl.fromJson;

  int get playbackState;
  @JsonKey(ignore: true)
  _$$StateListenerModelImplCopyWith<_$StateListenerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPlayErrorListenerModelImplCopyWith<$Res> {
  factory _$$OnPlayErrorListenerModelImplCopyWith(
          _$OnPlayErrorListenerModelImpl value,
          $Res Function(_$OnPlayErrorListenerModelImpl) then) =
      __$$OnPlayErrorListenerModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$OnPlayErrorListenerModelImplCopyWithImpl<$Res>
    extends _$VideoListenerModelCopyWithImpl<$Res,
        _$OnPlayErrorListenerModelImpl>
    implements _$$OnPlayErrorListenerModelImplCopyWith<$Res> {
  __$$OnPlayErrorListenerModelImplCopyWithImpl(
      _$OnPlayErrorListenerModelImpl _value,
      $Res Function(_$OnPlayErrorListenerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$OnPlayErrorListenerModelImpl(
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnPlayErrorListenerModelImpl extends OnPlayErrorListenerModel {
  const _$OnPlayErrorListenerModelImpl({this.error, final String? $type})
      : $type = $type ?? 'onPlayError',
        super._();

  factory _$OnPlayErrorListenerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnPlayErrorListenerModelImplFromJson(json);

  @override
  final Object? error;

  @JsonKey(name: 'dataType')
  final String $type;

  @override
  String toString() {
    return 'VideoListenerModel.onPlayError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPlayErrorListenerModelImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPlayErrorListenerModelImplCopyWith<_$OnPlayErrorListenerModelImpl>
      get copyWith => __$$OnPlayErrorListenerModelImplCopyWithImpl<
          _$OnPlayErrorListenerModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int progress, int secProgress, int currentPosition, int duration)
        progress,
    required TResult Function(int playbackState) playbackState,
    required TResult Function(Object? error) onPlayError,
  }) {
    return onPlayError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult? Function(int playbackState)? playbackState,
    TResult? Function(Object? error)? onPlayError,
  }) {
    return onPlayError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult Function(int playbackState)? playbackState,
    TResult Function(Object? error)? onPlayError,
    required TResult orElse(),
  }) {
    if (onPlayError != null) {
      return onPlayError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProgressListenerModel value) progress,
    required TResult Function(StateListenerModel value) playbackState,
    required TResult Function(OnPlayErrorListenerModel value) onPlayError,
  }) {
    return onPlayError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProgressListenerModel value)? progress,
    TResult? Function(StateListenerModel value)? playbackState,
    TResult? Function(OnPlayErrorListenerModel value)? onPlayError,
  }) {
    return onPlayError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressListenerModel value)? progress,
    TResult Function(StateListenerModel value)? playbackState,
    TResult Function(OnPlayErrorListenerModel value)? onPlayError,
    required TResult orElse(),
  }) {
    if (onPlayError != null) {
      return onPlayError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OnPlayErrorListenerModelImplToJson(
      this,
    );
  }
}

abstract class OnPlayErrorListenerModel extends VideoListenerModel {
  const factory OnPlayErrorListenerModel({final Object? error}) =
      _$OnPlayErrorListenerModelImpl;
  const OnPlayErrorListenerModel._() : super._();

  factory OnPlayErrorListenerModel.fromJson(Map<String, dynamic> json) =
      _$OnPlayErrorListenerModelImpl.fromJson;

  Object? get error;
  @JsonKey(ignore: true)
  _$$OnPlayErrorListenerModelImplCopyWith<_$OnPlayErrorListenerModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
