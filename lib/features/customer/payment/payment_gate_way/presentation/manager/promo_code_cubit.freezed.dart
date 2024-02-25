// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PromoCodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() promoLoading,
    required TResult Function(PromoCodeEntity? promoCodeEntity) promoSuccess,
    required TResult Function(String? errCode, String? err) promoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? promoLoading,
    TResult? Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult? Function(String? errCode, String? err)? promoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? promoLoading,
    TResult Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult Function(String? errCode, String? err)? promoError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PromoLoading value) promoLoading,
    required TResult Function(PromoSuccess value) promoSuccess,
    required TResult Function(PromoError value) promoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PromoLoading value)? promoLoading,
    TResult? Function(PromoSuccess value)? promoSuccess,
    TResult? Function(PromoError value)? promoError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PromoLoading value)? promoLoading,
    TResult Function(PromoSuccess value)? promoSuccess,
    TResult Function(PromoError value)? promoError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeStateCopyWith<$Res> {
  factory $PromoCodeStateCopyWith(
          PromoCodeState value, $Res Function(PromoCodeState) then) =
      _$PromoCodeStateCopyWithImpl<$Res, PromoCodeState>;
}

/// @nodoc
class _$PromoCodeStateCopyWithImpl<$Res, $Val extends PromoCodeState>
    implements $PromoCodeStateCopyWith<$Res> {
  _$PromoCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PromoCodeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PromoCodeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() promoLoading,
    required TResult Function(PromoCodeEntity? promoCodeEntity) promoSuccess,
    required TResult Function(String? errCode, String? err) promoError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? promoLoading,
    TResult? Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult? Function(String? errCode, String? err)? promoError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? promoLoading,
    TResult Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult Function(String? errCode, String? err)? promoError,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(PromoLoading value) promoLoading,
    required TResult Function(PromoSuccess value) promoSuccess,
    required TResult Function(PromoError value) promoError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PromoLoading value)? promoLoading,
    TResult? Function(PromoSuccess value)? promoSuccess,
    TResult? Function(PromoError value)? promoError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PromoLoading value)? promoLoading,
    TResult Function(PromoSuccess value)? promoSuccess,
    TResult Function(PromoError value)? promoError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PromoCodeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PromoLoadingImplCopyWith<$Res> {
  factory _$$PromoLoadingImplCopyWith(
          _$PromoLoadingImpl value, $Res Function(_$PromoLoadingImpl) then) =
      __$$PromoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PromoLoadingImplCopyWithImpl<$Res>
    extends _$PromoCodeStateCopyWithImpl<$Res, _$PromoLoadingImpl>
    implements _$$PromoLoadingImplCopyWith<$Res> {
  __$$PromoLoadingImplCopyWithImpl(
      _$PromoLoadingImpl _value, $Res Function(_$PromoLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PromoLoadingImpl implements PromoLoading {
  const _$PromoLoadingImpl();

  @override
  String toString() {
    return 'PromoCodeState.promoLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PromoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() promoLoading,
    required TResult Function(PromoCodeEntity? promoCodeEntity) promoSuccess,
    required TResult Function(String? errCode, String? err) promoError,
  }) {
    return promoLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? promoLoading,
    TResult? Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult? Function(String? errCode, String? err)? promoError,
  }) {
    return promoLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? promoLoading,
    TResult Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult Function(String? errCode, String? err)? promoError,
    required TResult orElse(),
  }) {
    if (promoLoading != null) {
      return promoLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PromoLoading value) promoLoading,
    required TResult Function(PromoSuccess value) promoSuccess,
    required TResult Function(PromoError value) promoError,
  }) {
    return promoLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PromoLoading value)? promoLoading,
    TResult? Function(PromoSuccess value)? promoSuccess,
    TResult? Function(PromoError value)? promoError,
  }) {
    return promoLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PromoLoading value)? promoLoading,
    TResult Function(PromoSuccess value)? promoSuccess,
    TResult Function(PromoError value)? promoError,
    required TResult orElse(),
  }) {
    if (promoLoading != null) {
      return promoLoading(this);
    }
    return orElse();
  }
}

abstract class PromoLoading implements PromoCodeState {
  const factory PromoLoading() = _$PromoLoadingImpl;
}

/// @nodoc
abstract class _$$PromoSuccessImplCopyWith<$Res> {
  factory _$$PromoSuccessImplCopyWith(
          _$PromoSuccessImpl value, $Res Function(_$PromoSuccessImpl) then) =
      __$$PromoSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PromoCodeEntity? promoCodeEntity});
}

/// @nodoc
class __$$PromoSuccessImplCopyWithImpl<$Res>
    extends _$PromoCodeStateCopyWithImpl<$Res, _$PromoSuccessImpl>
    implements _$$PromoSuccessImplCopyWith<$Res> {
  __$$PromoSuccessImplCopyWithImpl(
      _$PromoSuccessImpl _value, $Res Function(_$PromoSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCodeEntity = freezed,
  }) {
    return _then(_$PromoSuccessImpl(
      freezed == promoCodeEntity
          ? _value.promoCodeEntity
          : promoCodeEntity // ignore: cast_nullable_to_non_nullable
              as PromoCodeEntity?,
    ));
  }
}

/// @nodoc

class _$PromoSuccessImpl implements PromoSuccess {
  const _$PromoSuccessImpl(this.promoCodeEntity);

  @override
  final PromoCodeEntity? promoCodeEntity;

  @override
  String toString() {
    return 'PromoCodeState.promoSuccess(promoCodeEntity: $promoCodeEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoSuccessImpl &&
            (identical(other.promoCodeEntity, promoCodeEntity) ||
                other.promoCodeEntity == promoCodeEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, promoCodeEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoSuccessImplCopyWith<_$PromoSuccessImpl> get copyWith =>
      __$$PromoSuccessImplCopyWithImpl<_$PromoSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() promoLoading,
    required TResult Function(PromoCodeEntity? promoCodeEntity) promoSuccess,
    required TResult Function(String? errCode, String? err) promoError,
  }) {
    return promoSuccess(promoCodeEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? promoLoading,
    TResult? Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult? Function(String? errCode, String? err)? promoError,
  }) {
    return promoSuccess?.call(promoCodeEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? promoLoading,
    TResult Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult Function(String? errCode, String? err)? promoError,
    required TResult orElse(),
  }) {
    if (promoSuccess != null) {
      return promoSuccess(promoCodeEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PromoLoading value) promoLoading,
    required TResult Function(PromoSuccess value) promoSuccess,
    required TResult Function(PromoError value) promoError,
  }) {
    return promoSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PromoLoading value)? promoLoading,
    TResult? Function(PromoSuccess value)? promoSuccess,
    TResult? Function(PromoError value)? promoError,
  }) {
    return promoSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PromoLoading value)? promoLoading,
    TResult Function(PromoSuccess value)? promoSuccess,
    TResult Function(PromoError value)? promoError,
    required TResult orElse(),
  }) {
    if (promoSuccess != null) {
      return promoSuccess(this);
    }
    return orElse();
  }
}

abstract class PromoSuccess implements PromoCodeState {
  const factory PromoSuccess(final PromoCodeEntity? promoCodeEntity) =
      _$PromoSuccessImpl;

  PromoCodeEntity? get promoCodeEntity;
  @JsonKey(ignore: true)
  _$$PromoSuccessImplCopyWith<_$PromoSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PromoErrorImplCopyWith<$Res> {
  factory _$$PromoErrorImplCopyWith(
          _$PromoErrorImpl value, $Res Function(_$PromoErrorImpl) then) =
      __$$PromoErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errCode, String? err});
}

/// @nodoc
class __$$PromoErrorImplCopyWithImpl<$Res>
    extends _$PromoCodeStateCopyWithImpl<$Res, _$PromoErrorImpl>
    implements _$$PromoErrorImplCopyWith<$Res> {
  __$$PromoErrorImplCopyWithImpl(
      _$PromoErrorImpl _value, $Res Function(_$PromoErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errCode = freezed,
    Object? err = freezed,
  }) {
    return _then(_$PromoErrorImpl(
      freezed == errCode
          ? _value.errCode
          : errCode // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PromoErrorImpl implements PromoError {
  const _$PromoErrorImpl(this.errCode, this.err);

  @override
  final String? errCode;
  @override
  final String? err;

  @override
  String toString() {
    return 'PromoCodeState.promoError(errCode: $errCode, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoErrorImpl &&
            (identical(other.errCode, errCode) || other.errCode == errCode) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errCode, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoErrorImplCopyWith<_$PromoErrorImpl> get copyWith =>
      __$$PromoErrorImplCopyWithImpl<_$PromoErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() promoLoading,
    required TResult Function(PromoCodeEntity? promoCodeEntity) promoSuccess,
    required TResult Function(String? errCode, String? err) promoError,
  }) {
    return promoError(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? promoLoading,
    TResult? Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult? Function(String? errCode, String? err)? promoError,
  }) {
    return promoError?.call(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? promoLoading,
    TResult Function(PromoCodeEntity? promoCodeEntity)? promoSuccess,
    TResult Function(String? errCode, String? err)? promoError,
    required TResult orElse(),
  }) {
    if (promoError != null) {
      return promoError(errCode, err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PromoLoading value) promoLoading,
    required TResult Function(PromoSuccess value) promoSuccess,
    required TResult Function(PromoError value) promoError,
  }) {
    return promoError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PromoLoading value)? promoLoading,
    TResult? Function(PromoSuccess value)? promoSuccess,
    TResult? Function(PromoError value)? promoError,
  }) {
    return promoError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PromoLoading value)? promoLoading,
    TResult Function(PromoSuccess value)? promoSuccess,
    TResult Function(PromoError value)? promoError,
    required TResult orElse(),
  }) {
    if (promoError != null) {
      return promoError(this);
    }
    return orElse();
  }
}

abstract class PromoError implements PromoCodeState {
  const factory PromoError(final String? errCode, final String? err) =
      _$PromoErrorImpl;

  String? get errCode;
  String? get err;
  @JsonKey(ignore: true)
  _$$PromoErrorImplCopyWith<_$PromoErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
