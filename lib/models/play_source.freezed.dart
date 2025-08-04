// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
