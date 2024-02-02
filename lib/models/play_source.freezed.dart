// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaySource {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(Uri uri) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(Uri uri)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(Uri uri)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlaySourceWithFile value) file,
    required TResult Function(_PlaySourceWithNetwork value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlaySourceWithFile value)? file,
    TResult? Function(_PlaySourceWithNetwork value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlaySourceWithFile value)? file,
    TResult Function(_PlaySourceWithNetwork value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaySourceCopyWith<$Res> {
  factory $PlaySourceCopyWith(
          PlaySource value, $Res Function(PlaySource) then) =
      _$PlaySourceCopyWithImpl<$Res, PlaySource>;
}

/// @nodoc
class _$PlaySourceCopyWithImpl<$Res, $Val extends PlaySource>
    implements $PlaySourceCopyWith<$Res> {
  _$PlaySourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlaySourceWithFileImplCopyWith<$Res> {
  factory _$$PlaySourceWithFileImplCopyWith(_$PlaySourceWithFileImpl value,
          $Res Function(_$PlaySourceWithFileImpl) then) =
      __$$PlaySourceWithFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$PlaySourceWithFileImplCopyWithImpl<$Res>
    extends _$PlaySourceCopyWithImpl<$Res, _$PlaySourceWithFileImpl>
    implements _$$PlaySourceWithFileImplCopyWith<$Res> {
  __$$PlaySourceWithFileImplCopyWithImpl(_$PlaySourceWithFileImpl _value,
      $Res Function(_$PlaySourceWithFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$PlaySourceWithFileImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$PlaySourceWithFileImpl extends _PlaySourceWithFile {
  const _$PlaySourceWithFileImpl({required this.file}) : super._();

  @override
  final File file;

  @override
  String toString() {
    return 'PlaySource.file(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaySourceWithFileImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaySourceWithFileImplCopyWith<_$PlaySourceWithFileImpl> get copyWith =>
      __$$PlaySourceWithFileImplCopyWithImpl<_$PlaySourceWithFileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(Uri uri) network,
  }) {
    return file(this.file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(Uri uri)? network,
  }) {
    return file?.call(this.file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(Uri uri)? network,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this.file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlaySourceWithFile value) file,
    required TResult Function(_PlaySourceWithNetwork value) network,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlaySourceWithFile value)? file,
    TResult? Function(_PlaySourceWithNetwork value)? network,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlaySourceWithFile value)? file,
    TResult Function(_PlaySourceWithNetwork value)? network,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }
}

abstract class _PlaySourceWithFile extends PlaySource {
  const factory _PlaySourceWithFile({required final File file}) =
      _$PlaySourceWithFileImpl;
  const _PlaySourceWithFile._() : super._();

  File get file;
  @JsonKey(ignore: true)
  _$$PlaySourceWithFileImplCopyWith<_$PlaySourceWithFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlaySourceWithNetworkImplCopyWith<$Res> {
  factory _$$PlaySourceWithNetworkImplCopyWith(
          _$PlaySourceWithNetworkImpl value,
          $Res Function(_$PlaySourceWithNetworkImpl) then) =
      __$$PlaySourceWithNetworkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class __$$PlaySourceWithNetworkImplCopyWithImpl<$Res>
    extends _$PlaySourceCopyWithImpl<$Res, _$PlaySourceWithNetworkImpl>
    implements _$$PlaySourceWithNetworkImplCopyWith<$Res> {
  __$$PlaySourceWithNetworkImplCopyWithImpl(_$PlaySourceWithNetworkImpl _value,
      $Res Function(_$PlaySourceWithNetworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_$PlaySourceWithNetworkImpl(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$PlaySourceWithNetworkImpl extends _PlaySourceWithNetwork {
  const _$PlaySourceWithNetworkImpl({required this.uri}) : super._();

  @override
  final Uri uri;

  @override
  String toString() {
    return 'PlaySource.network(uri: $uri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaySourceWithNetworkImpl &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaySourceWithNetworkImplCopyWith<_$PlaySourceWithNetworkImpl>
      get copyWith => __$$PlaySourceWithNetworkImplCopyWithImpl<
          _$PlaySourceWithNetworkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(Uri uri) network,
  }) {
    return network(uri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(Uri uri)? network,
  }) {
    return network?.call(uri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(Uri uri)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(uri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlaySourceWithFile value) file,
    required TResult Function(_PlaySourceWithNetwork value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlaySourceWithFile value)? file,
    TResult? Function(_PlaySourceWithNetwork value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlaySourceWithFile value)? file,
    TResult Function(_PlaySourceWithNetwork value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _PlaySourceWithNetwork extends PlaySource {
  const factory _PlaySourceWithNetwork({required final Uri uri}) =
      _$PlaySourceWithNetworkImpl;
  const _PlaySourceWithNetwork._() : super._();

  Uri get uri;
  @JsonKey(ignore: true)
  _$$PlaySourceWithNetworkImplCopyWith<_$PlaySourceWithNetworkImpl>
      get copyWith => throw _privateConstructorUsedError;
}
