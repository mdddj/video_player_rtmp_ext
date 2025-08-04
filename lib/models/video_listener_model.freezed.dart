// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_listener_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
  /// Serializes this VideoListenerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VideoListenerModel);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VideoListenerModel()';
  }
}

/// @nodoc
class $VideoListenerModelCopyWith<$Res> {
  $VideoListenerModelCopyWith(
      VideoListenerModel _, $Res Function(VideoListenerModel) __);
}

/// Adds pattern-matching-related methods to [VideoListenerModel].
extension VideoListenerModelPatterns on VideoListenerModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressListenerModel value)? progress,
    TResult Function(StateListenerModel value)? playbackState,
    TResult Function(OnPlayErrorListenerModel value)? onPlayError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProgressListenerModel() when progress != null:
        return progress(_that);
      case StateListenerModel() when playbackState != null:
        return playbackState(_that);
      case OnPlayErrorListenerModel() when onPlayError != null:
        return onPlayError(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProgressListenerModel value) progress,
    required TResult Function(StateListenerModel value) playbackState,
    required TResult Function(OnPlayErrorListenerModel value) onPlayError,
  }) {
    final _that = this;
    switch (_that) {
      case ProgressListenerModel():
        return progress(_that);
      case StateListenerModel():
        return playbackState(_that);
      case OnPlayErrorListenerModel():
        return onPlayError(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProgressListenerModel value)? progress,
    TResult? Function(StateListenerModel value)? playbackState,
    TResult? Function(OnPlayErrorListenerModel value)? onPlayError,
  }) {
    final _that = this;
    switch (_that) {
      case ProgressListenerModel() when progress != null:
        return progress(_that);
      case StateListenerModel() when playbackState != null:
        return playbackState(_that);
      case OnPlayErrorListenerModel() when onPlayError != null:
        return onPlayError(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult Function(int playbackState)? playbackState,
    TResult Function(Object? error)? onPlayError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProgressListenerModel() when progress != null:
        return progress(_that.progress, _that.secProgress,
            _that.currentPosition, _that.duration);
      case StateListenerModel() when playbackState != null:
        return playbackState(_that.playbackState);
      case OnPlayErrorListenerModel() when onPlayError != null:
        return onPlayError(_that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int progress, int secProgress, int currentPosition, int duration)
        progress,
    required TResult Function(int playbackState) playbackState,
    required TResult Function(Object? error) onPlayError,
  }) {
    final _that = this;
    switch (_that) {
      case ProgressListenerModel():
        return progress(_that.progress, _that.secProgress,
            _that.currentPosition, _that.duration);
      case StateListenerModel():
        return playbackState(_that.playbackState);
      case OnPlayErrorListenerModel():
        return onPlayError(_that.error);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int progress, int secProgress, int currentPosition, int duration)?
        progress,
    TResult? Function(int playbackState)? playbackState,
    TResult? Function(Object? error)? onPlayError,
  }) {
    final _that = this;
    switch (_that) {
      case ProgressListenerModel() when progress != null:
        return progress(_that.progress, _that.secProgress,
            _that.currentPosition, _that.duration);
      case StateListenerModel() when playbackState != null:
        return playbackState(_that.playbackState);
      case OnPlayErrorListenerModel() when onPlayError != null:
        return onPlayError(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class ProgressListenerModel extends VideoListenerModel {
  const ProgressListenerModel(
      {required this.progress,
      required this.secProgress,
      required this.currentPosition,
      required this.duration,
      final String? $type})
      : $type = $type ?? 'ProgressListener',
        super._();
  factory ProgressListenerModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressListenerModelFromJson(json);

  final int progress;
  final int secProgress;
  final int currentPosition;
  final int duration;

  @JsonKey(name: 'dataType')
  final String $type;

  /// Create a copy of VideoListenerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProgressListenerModelCopyWith<ProgressListenerModel> get copyWith =>
      _$ProgressListenerModelCopyWithImpl<ProgressListenerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProgressListenerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProgressListenerModel &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.secProgress, secProgress) ||
                other.secProgress == secProgress) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, progress, secProgress, currentPosition, duration);

  @override
  String toString() {
    return 'VideoListenerModel.progress(progress: $progress, secProgress: $secProgress, currentPosition: $currentPosition, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $ProgressListenerModelCopyWith<$Res>
    implements $VideoListenerModelCopyWith<$Res> {
  factory $ProgressListenerModelCopyWith(ProgressListenerModel value,
          $Res Function(ProgressListenerModel) _then) =
      _$ProgressListenerModelCopyWithImpl;
  @useResult
  $Res call({int progress, int secProgress, int currentPosition, int duration});
}

/// @nodoc
class _$ProgressListenerModelCopyWithImpl<$Res>
    implements $ProgressListenerModelCopyWith<$Res> {
  _$ProgressListenerModelCopyWithImpl(this._self, this._then);

  final ProgressListenerModel _self;
  final $Res Function(ProgressListenerModel) _then;

  /// Create a copy of VideoListenerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? progress = null,
    Object? secProgress = null,
    Object? currentPosition = null,
    Object? duration = null,
  }) {
    return _then(ProgressListenerModel(
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      secProgress: null == secProgress
          ? _self.secProgress
          : secProgress // ignore: cast_nullable_to_non_nullable
              as int,
      currentPosition: null == currentPosition
          ? _self.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class StateListenerModel extends VideoListenerModel {
  const StateListenerModel({required this.playbackState, final String? $type})
      : $type = $type ?? 'sendCallbackEvent',
        super._();
  factory StateListenerModel.fromJson(Map<String, dynamic> json) =>
      _$StateListenerModelFromJson(json);

  final int playbackState;

  @JsonKey(name: 'dataType')
  final String $type;

  /// Create a copy of VideoListenerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StateListenerModelCopyWith<StateListenerModel> get copyWith =>
      _$StateListenerModelCopyWithImpl<StateListenerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StateListenerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StateListenerModel &&
            (identical(other.playbackState, playbackState) ||
                other.playbackState == playbackState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playbackState);

  @override
  String toString() {
    return 'VideoListenerModel.playbackState(playbackState: $playbackState)';
  }
}

/// @nodoc
abstract mixin class $StateListenerModelCopyWith<$Res>
    implements $VideoListenerModelCopyWith<$Res> {
  factory $StateListenerModelCopyWith(
          StateListenerModel value, $Res Function(StateListenerModel) _then) =
      _$StateListenerModelCopyWithImpl;
  @useResult
  $Res call({int playbackState});
}

/// @nodoc
class _$StateListenerModelCopyWithImpl<$Res>
    implements $StateListenerModelCopyWith<$Res> {
  _$StateListenerModelCopyWithImpl(this._self, this._then);

  final StateListenerModel _self;
  final $Res Function(StateListenerModel) _then;

  /// Create a copy of VideoListenerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playbackState = null,
  }) {
    return _then(StateListenerModel(
      playbackState: null == playbackState
          ? _self.playbackState
          : playbackState // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class OnPlayErrorListenerModel extends VideoListenerModel {
  const OnPlayErrorListenerModel({this.error, final String? $type})
      : $type = $type ?? 'onPlayError',
        super._();
  factory OnPlayErrorListenerModel.fromJson(Map<String, dynamic> json) =>
      _$OnPlayErrorListenerModelFromJson(json);

  final Object? error;

  @JsonKey(name: 'dataType')
  final String $type;

  /// Create a copy of VideoListenerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnPlayErrorListenerModelCopyWith<OnPlayErrorListenerModel> get copyWith =>
      _$OnPlayErrorListenerModelCopyWithImpl<OnPlayErrorListenerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OnPlayErrorListenerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnPlayErrorListenerModel &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'VideoListenerModel.onPlayError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $OnPlayErrorListenerModelCopyWith<$Res>
    implements $VideoListenerModelCopyWith<$Res> {
  factory $OnPlayErrorListenerModelCopyWith(OnPlayErrorListenerModel value,
          $Res Function(OnPlayErrorListenerModel) _then) =
      _$OnPlayErrorListenerModelCopyWithImpl;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class _$OnPlayErrorListenerModelCopyWithImpl<$Res>
    implements $OnPlayErrorListenerModelCopyWith<$Res> {
  _$OnPlayErrorListenerModelCopyWithImpl(this._self, this._then);

  final OnPlayErrorListenerModel _self;
  final $Res Function(OnPlayErrorListenerModel) _then;

  /// Create a copy of VideoListenerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = freezed,
  }) {
    return _then(OnPlayErrorListenerModel(
      error: freezed == error ? _self.error : error,
    ));
  }
}

// dart format on
