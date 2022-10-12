// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Search_State.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() nodata,
    required TResult Function(TopAllTimeresponse data) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateError value) error,
    required TResult Function(_SearchStateNodata value) nodata,
    required TResult Function(_SearchStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class _$SearchStateInitialCopyWith<$Res> {
  factory _$SearchStateInitialCopyWith(
          _SearchStateInitial value, $Res Function(_SearchStateInitial) then) =
      __$SearchStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchStateInitialCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateInitialCopyWith<$Res> {
  __$SearchStateInitialCopyWithImpl(
      _SearchStateInitial _value, $Res Function(_SearchStateInitial) _then)
      : super(_value, (v) => _then(v as _SearchStateInitial));

  @override
  _SearchStateInitial get _value => super._value as _SearchStateInitial;
}

/// @nodoc

class _$_SearchStateInitial implements _SearchStateInitial {
  const _$_SearchStateInitial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() nodata,
    required TResult Function(TopAllTimeresponse data) data,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateError value) error,
    required TResult Function(_SearchStateNodata value) nodata,
    required TResult Function(_SearchStateData value) data,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SearchStateInitial implements SearchState {
  const factory _SearchStateInitial() = _$_SearchStateInitial;
}

/// @nodoc
abstract class _$SearchStateLoadingCopyWith<$Res> {
  factory _$SearchStateLoadingCopyWith(
          _SearchStateLoading value, $Res Function(_SearchStateLoading) then) =
      __$SearchStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchStateLoadingCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateLoadingCopyWith<$Res> {
  __$SearchStateLoadingCopyWithImpl(
      _SearchStateLoading _value, $Res Function(_SearchStateLoading) _then)
      : super(_value, (v) => _then(v as _SearchStateLoading));

  @override
  _SearchStateLoading get _value => super._value as _SearchStateLoading;
}

/// @nodoc

class _$_SearchStateLoading implements _SearchStateLoading {
  const _$_SearchStateLoading();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() nodata,
    required TResult Function(TopAllTimeresponse data) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateError value) error,
    required TResult Function(_SearchStateNodata value) nodata,
    required TResult Function(_SearchStateData value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SearchStateLoading implements SearchState {
  const factory _SearchStateLoading() = _$_SearchStateLoading;
}

/// @nodoc
abstract class _$SearchStateErrorCopyWith<$Res> {
  factory _$SearchStateErrorCopyWith(
          _SearchStateError value, $Res Function(_SearchStateError) then) =
      __$SearchStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchStateErrorCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateErrorCopyWith<$Res> {
  __$SearchStateErrorCopyWithImpl(
      _SearchStateError _value, $Res Function(_SearchStateError) _then)
      : super(_value, (v) => _then(v as _SearchStateError));

  @override
  _SearchStateError get _value => super._value as _SearchStateError;
}

/// @nodoc

class _$_SearchStateError implements _SearchStateError {
  const _$_SearchStateError();

  @override
  String toString() {
    return 'SearchState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() nodata,
    required TResult Function(TopAllTimeresponse data) data,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateError value) error,
    required TResult Function(_SearchStateNodata value) nodata,
    required TResult Function(_SearchStateData value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SearchStateError implements SearchState {
  const factory _SearchStateError() = _$_SearchStateError;
}

/// @nodoc
abstract class _$SearchStateNodataCopyWith<$Res> {
  factory _$SearchStateNodataCopyWith(
          _SearchStateNodata value, $Res Function(_SearchStateNodata) then) =
      __$SearchStateNodataCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchStateNodataCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateNodataCopyWith<$Res> {
  __$SearchStateNodataCopyWithImpl(
      _SearchStateNodata _value, $Res Function(_SearchStateNodata) _then)
      : super(_value, (v) => _then(v as _SearchStateNodata));

  @override
  _SearchStateNodata get _value => super._value as _SearchStateNodata;
}

/// @nodoc

class _$_SearchStateNodata implements _SearchStateNodata {
  const _$_SearchStateNodata();

  @override
  String toString() {
    return 'SearchState.nodata()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchStateNodata);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() nodata,
    required TResult Function(TopAllTimeresponse data) data,
  }) {
    return nodata();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
  }) {
    return nodata?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
    required TResult orElse(),
  }) {
    if (nodata != null) {
      return nodata();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateError value) error,
    required TResult Function(_SearchStateNodata value) nodata,
    required TResult Function(_SearchStateData value) data,
  }) {
    return nodata(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
  }) {
    return nodata?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
    required TResult orElse(),
  }) {
    if (nodata != null) {
      return nodata(this);
    }
    return orElse();
  }
}

abstract class _SearchStateNodata implements SearchState {
  const factory _SearchStateNodata() = _$_SearchStateNodata;
}

/// @nodoc
abstract class _$SearchStateDataCopyWith<$Res> {
  factory _$SearchStateDataCopyWith(
          _SearchStateData value, $Res Function(_SearchStateData) then) =
      __$SearchStateDataCopyWithImpl<$Res>;
  $Res call({TopAllTimeresponse data});
}

/// @nodoc
class __$SearchStateDataCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateDataCopyWith<$Res> {
  __$SearchStateDataCopyWithImpl(
      _SearchStateData _value, $Res Function(_SearchStateData) _then)
      : super(_value, (v) => _then(v as _SearchStateData));

  @override
  _SearchStateData get _value => super._value as _SearchStateData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_SearchStateData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TopAllTimeresponse,
    ));
  }
}

/// @nodoc

class _$_SearchStateData implements _SearchStateData {
  const _$_SearchStateData({required this.data});

  @override
  final TopAllTimeresponse data;

  @override
  String toString() {
    return 'SearchState.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchStateData &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$SearchStateDataCopyWith<_SearchStateData> get copyWith =>
      __$SearchStateDataCopyWithImpl<_SearchStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() nodata,
    required TResult Function(TopAllTimeresponse data) data,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? nodata,
    TResult Function(TopAllTimeresponse data)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateError value) error,
    required TResult Function(_SearchStateNodata value) nodata,
    required TResult Function(_SearchStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateError value)? error,
    TResult Function(_SearchStateNodata value)? nodata,
    TResult Function(_SearchStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _SearchStateData implements SearchState {
  const factory _SearchStateData({required final TopAllTimeresponse data}) =
      _$_SearchStateData;

  TopAllTimeresponse get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchStateDataCopyWith<_SearchStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
