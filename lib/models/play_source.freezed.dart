// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaySource {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlaySource);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlaySource()';
  }
}

/// @nodoc
class $PlaySourceCopyWith<$Res> {
  $PlaySourceCopyWith(PlaySource _, $Res Function(PlaySource) __);
}

/// Adds pattern-matching-related methods to [PlaySource].
extension PlaySourcePatterns on PlaySource {
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
    TResult Function(_PlaySourceWithFile value)? file,
    TResult Function(_PlaySourceWithNetwork value)? network,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaySourceWithFile() when file != null:
        return file(_that);
      case _PlaySourceWithNetwork() when network != null:
        return network(_that);
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
    required TResult Function(_PlaySourceWithFile value) file,
    required TResult Function(_PlaySourceWithNetwork value) network,
  }) {
    final _that = this;
    switch (_that) {
      case _PlaySourceWithFile():
        return file(_that);
      case _PlaySourceWithNetwork():
        return network(_that);
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
    TResult? Function(_PlaySourceWithFile value)? file,
    TResult? Function(_PlaySourceWithNetwork value)? network,
  }) {
    final _that = this;
    switch (_that) {
      case _PlaySourceWithFile() when file != null:
        return file(_that);
      case _PlaySourceWithNetwork() when network != null:
        return network(_that);
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
    TResult Function(File file)? file,
    TResult Function(Uri uri)? network,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaySourceWithFile() when file != null:
        return file(_that.file);
      case _PlaySourceWithNetwork() when network != null:
        return network(_that.uri);
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
    required TResult Function(File file) file,
    required TResult Function(Uri uri) network,
  }) {
    final _that = this;
    switch (_that) {
      case _PlaySourceWithFile():
        return file(_that.file);
      case _PlaySourceWithNetwork():
        return network(_that.uri);
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
    TResult? Function(File file)? file,
    TResult? Function(Uri uri)? network,
  }) {
    final _that = this;
    switch (_that) {
      case _PlaySourceWithFile() when file != null:
        return file(_that.file);
      case _PlaySourceWithNetwork() when network != null:
        return network(_that.uri);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlaySourceWithFile extends PlaySource {
  const _PlaySourceWithFile({required this.file}) : super._();

  final File file;

  /// Create a copy of PlaySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaySourceWithFileCopyWith<_PlaySourceWithFile> get copyWith =>
      __$PlaySourceWithFileCopyWithImpl<_PlaySourceWithFile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaySourceWithFile &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @override
  String toString() {
    return 'PlaySource.file(file: $file)';
  }
}

/// @nodoc
abstract mixin class _$PlaySourceWithFileCopyWith<$Res>
    implements $PlaySourceCopyWith<$Res> {
  factory _$PlaySourceWithFileCopyWith(
          _PlaySourceWithFile value, $Res Function(_PlaySourceWithFile) _then) =
      __$PlaySourceWithFileCopyWithImpl;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$PlaySourceWithFileCopyWithImpl<$Res>
    implements _$PlaySourceWithFileCopyWith<$Res> {
  __$PlaySourceWithFileCopyWithImpl(this._self, this._then);

  final _PlaySourceWithFile _self;
  final $Res Function(_PlaySourceWithFile) _then;

  /// Create a copy of PlaySource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? file = null,
  }) {
    return _then(_PlaySourceWithFile(
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _PlaySourceWithNetwork extends PlaySource {
  const _PlaySourceWithNetwork({required this.uri}) : super._();

  final Uri uri;

  /// Create a copy of PlaySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaySourceWithNetworkCopyWith<_PlaySourceWithNetwork> get copyWith =>
      __$PlaySourceWithNetworkCopyWithImpl<_PlaySourceWithNetwork>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaySourceWithNetwork &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @override
  String toString() {
    return 'PlaySource.network(uri: $uri)';
  }
}

/// @nodoc
abstract mixin class _$PlaySourceWithNetworkCopyWith<$Res>
    implements $PlaySourceCopyWith<$Res> {
  factory _$PlaySourceWithNetworkCopyWith(_PlaySourceWithNetwork value,
          $Res Function(_PlaySourceWithNetwork) _then) =
      __$PlaySourceWithNetworkCopyWithImpl;
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class __$PlaySourceWithNetworkCopyWithImpl<$Res>
    implements _$PlaySourceWithNetworkCopyWith<$Res> {
  __$PlaySourceWithNetworkCopyWithImpl(this._self, this._then);

  final _PlaySourceWithNetwork _self;
  final $Res Function(_PlaySourceWithNetwork) _then;

  /// Create a copy of PlaySource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uri = null,
  }) {
    return _then(_PlaySourceWithNetwork(
      uri: null == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

// dart format on
