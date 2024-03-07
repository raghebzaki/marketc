// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_balance_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WithdrawBalanceStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() withdrawalLoading,
    required TResult Function(UserBalanceEntity withdrawal) withdrawalSuccess,
    required TResult Function(String errCode, String err) withdrawalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? withdrawalLoading,
    TResult? Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult? Function(String errCode, String err)? withdrawalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? withdrawalLoading,
    TResult Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult Function(String errCode, String err)? withdrawalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(WithdrawalLoading value) withdrawalLoading,
    required TResult Function(WithdrawalSuccess value) withdrawalSuccess,
    required TResult Function(WithdrawalError value) withdrawalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(WithdrawalLoading value)? withdrawalLoading,
    TResult? Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult? Function(WithdrawalError value)? withdrawalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(WithdrawalLoading value)? withdrawalLoading,
    TResult Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult Function(WithdrawalError value)? withdrawalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawBalanceStatesCopyWith<$Res> {
  factory $WithdrawBalanceStatesCopyWith(WithdrawBalanceStates value,
          $Res Function(WithdrawBalanceStates) then) =
      _$WithdrawBalanceStatesCopyWithImpl<$Res, WithdrawBalanceStates>;
}

/// @nodoc
class _$WithdrawBalanceStatesCopyWithImpl<$Res,
        $Val extends WithdrawBalanceStates>
    implements $WithdrawBalanceStatesCopyWith<$Res> {
  _$WithdrawBalanceStatesCopyWithImpl(this._value, this._then);

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
    extends _$WithdrawBalanceStatesCopyWithImpl<$Res, _$InitialImpl>
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
    return 'WithdrawBalanceStates.initial()';
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
    required TResult Function() withdrawalLoading,
    required TResult Function(UserBalanceEntity withdrawal) withdrawalSuccess,
    required TResult Function(String errCode, String err) withdrawalError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? withdrawalLoading,
    TResult? Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult? Function(String errCode, String err)? withdrawalError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? withdrawalLoading,
    TResult Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult Function(String errCode, String err)? withdrawalError,
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
    required TResult Function(WithdrawalLoading value) withdrawalLoading,
    required TResult Function(WithdrawalSuccess value) withdrawalSuccess,
    required TResult Function(WithdrawalError value) withdrawalError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(WithdrawalLoading value)? withdrawalLoading,
    TResult? Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult? Function(WithdrawalError value)? withdrawalError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(WithdrawalLoading value)? withdrawalLoading,
    TResult Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult Function(WithdrawalError value)? withdrawalError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WithdrawBalanceStates {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$WithdrawalLoadingImplCopyWith<$Res> {
  factory _$$WithdrawalLoadingImplCopyWith(_$WithdrawalLoadingImpl value,
          $Res Function(_$WithdrawalLoadingImpl) then) =
      __$$WithdrawalLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WithdrawalLoadingImplCopyWithImpl<$Res>
    extends _$WithdrawBalanceStatesCopyWithImpl<$Res, _$WithdrawalLoadingImpl>
    implements _$$WithdrawalLoadingImplCopyWith<$Res> {
  __$$WithdrawalLoadingImplCopyWithImpl(_$WithdrawalLoadingImpl _value,
      $Res Function(_$WithdrawalLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WithdrawalLoadingImpl implements WithdrawalLoading {
  const _$WithdrawalLoadingImpl();

  @override
  String toString() {
    return 'WithdrawBalanceStates.withdrawalLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WithdrawalLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() withdrawalLoading,
    required TResult Function(UserBalanceEntity withdrawal) withdrawalSuccess,
    required TResult Function(String errCode, String err) withdrawalError,
  }) {
    return withdrawalLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? withdrawalLoading,
    TResult? Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult? Function(String errCode, String err)? withdrawalError,
  }) {
    return withdrawalLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? withdrawalLoading,
    TResult Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult Function(String errCode, String err)? withdrawalError,
    required TResult orElse(),
  }) {
    if (withdrawalLoading != null) {
      return withdrawalLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(WithdrawalLoading value) withdrawalLoading,
    required TResult Function(WithdrawalSuccess value) withdrawalSuccess,
    required TResult Function(WithdrawalError value) withdrawalError,
  }) {
    return withdrawalLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(WithdrawalLoading value)? withdrawalLoading,
    TResult? Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult? Function(WithdrawalError value)? withdrawalError,
  }) {
    return withdrawalLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(WithdrawalLoading value)? withdrawalLoading,
    TResult Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult Function(WithdrawalError value)? withdrawalError,
    required TResult orElse(),
  }) {
    if (withdrawalLoading != null) {
      return withdrawalLoading(this);
    }
    return orElse();
  }
}

abstract class WithdrawalLoading implements WithdrawBalanceStates {
  const factory WithdrawalLoading() = _$WithdrawalLoadingImpl;
}

/// @nodoc
abstract class _$$WithdrawalSuccessImplCopyWith<$Res> {
  factory _$$WithdrawalSuccessImplCopyWith(_$WithdrawalSuccessImpl value,
          $Res Function(_$WithdrawalSuccessImpl) then) =
      __$$WithdrawalSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserBalanceEntity withdrawal});
}

/// @nodoc
class __$$WithdrawalSuccessImplCopyWithImpl<$Res>
    extends _$WithdrawBalanceStatesCopyWithImpl<$Res, _$WithdrawalSuccessImpl>
    implements _$$WithdrawalSuccessImplCopyWith<$Res> {
  __$$WithdrawalSuccessImplCopyWithImpl(_$WithdrawalSuccessImpl _value,
      $Res Function(_$WithdrawalSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withdrawal = null,
  }) {
    return _then(_$WithdrawalSuccessImpl(
      null == withdrawal
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as UserBalanceEntity,
    ));
  }
}

/// @nodoc

class _$WithdrawalSuccessImpl implements WithdrawalSuccess {
  const _$WithdrawalSuccessImpl(this.withdrawal);

  @override
  final UserBalanceEntity withdrawal;

  @override
  String toString() {
    return 'WithdrawBalanceStates.withdrawalSuccess(withdrawal: $withdrawal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawalSuccessImpl &&
            (identical(other.withdrawal, withdrawal) ||
                other.withdrawal == withdrawal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, withdrawal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawalSuccessImplCopyWith<_$WithdrawalSuccessImpl> get copyWith =>
      __$$WithdrawalSuccessImplCopyWithImpl<_$WithdrawalSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() withdrawalLoading,
    required TResult Function(UserBalanceEntity withdrawal) withdrawalSuccess,
    required TResult Function(String errCode, String err) withdrawalError,
  }) {
    return withdrawalSuccess(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? withdrawalLoading,
    TResult? Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult? Function(String errCode, String err)? withdrawalError,
  }) {
    return withdrawalSuccess?.call(withdrawal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? withdrawalLoading,
    TResult Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult Function(String errCode, String err)? withdrawalError,
    required TResult orElse(),
  }) {
    if (withdrawalSuccess != null) {
      return withdrawalSuccess(withdrawal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(WithdrawalLoading value) withdrawalLoading,
    required TResult Function(WithdrawalSuccess value) withdrawalSuccess,
    required TResult Function(WithdrawalError value) withdrawalError,
  }) {
    return withdrawalSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(WithdrawalLoading value)? withdrawalLoading,
    TResult? Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult? Function(WithdrawalError value)? withdrawalError,
  }) {
    return withdrawalSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(WithdrawalLoading value)? withdrawalLoading,
    TResult Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult Function(WithdrawalError value)? withdrawalError,
    required TResult orElse(),
  }) {
    if (withdrawalSuccess != null) {
      return withdrawalSuccess(this);
    }
    return orElse();
  }
}

abstract class WithdrawalSuccess implements WithdrawBalanceStates {
  const factory WithdrawalSuccess(final UserBalanceEntity withdrawal) =
      _$WithdrawalSuccessImpl;

  UserBalanceEntity get withdrawal;
  @JsonKey(ignore: true)
  _$$WithdrawalSuccessImplCopyWith<_$WithdrawalSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WithdrawalErrorImplCopyWith<$Res> {
  factory _$$WithdrawalErrorImplCopyWith(_$WithdrawalErrorImpl value,
          $Res Function(_$WithdrawalErrorImpl) then) =
      __$$WithdrawalErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errCode, String err});
}

/// @nodoc
class __$$WithdrawalErrorImplCopyWithImpl<$Res>
    extends _$WithdrawBalanceStatesCopyWithImpl<$Res, _$WithdrawalErrorImpl>
    implements _$$WithdrawalErrorImplCopyWith<$Res> {
  __$$WithdrawalErrorImplCopyWithImpl(
      _$WithdrawalErrorImpl _value, $Res Function(_$WithdrawalErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errCode = null,
    Object? err = null,
  }) {
    return _then(_$WithdrawalErrorImpl(
      null == errCode
          ? _value.errCode
          : errCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WithdrawalErrorImpl implements WithdrawalError {
  const _$WithdrawalErrorImpl(this.errCode, this.err);

  @override
  final String errCode;
  @override
  final String err;

  @override
  String toString() {
    return 'WithdrawBalanceStates.withdrawalError(errCode: $errCode, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawalErrorImpl &&
            (identical(other.errCode, errCode) || other.errCode == errCode) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errCode, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawalErrorImplCopyWith<_$WithdrawalErrorImpl> get copyWith =>
      __$$WithdrawalErrorImplCopyWithImpl<_$WithdrawalErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() withdrawalLoading,
    required TResult Function(UserBalanceEntity withdrawal) withdrawalSuccess,
    required TResult Function(String errCode, String err) withdrawalError,
  }) {
    return withdrawalError(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? withdrawalLoading,
    TResult? Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult? Function(String errCode, String err)? withdrawalError,
  }) {
    return withdrawalError?.call(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? withdrawalLoading,
    TResult Function(UserBalanceEntity withdrawal)? withdrawalSuccess,
    TResult Function(String errCode, String err)? withdrawalError,
    required TResult orElse(),
  }) {
    if (withdrawalError != null) {
      return withdrawalError(errCode, err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(WithdrawalLoading value) withdrawalLoading,
    required TResult Function(WithdrawalSuccess value) withdrawalSuccess,
    required TResult Function(WithdrawalError value) withdrawalError,
  }) {
    return withdrawalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(WithdrawalLoading value)? withdrawalLoading,
    TResult? Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult? Function(WithdrawalError value)? withdrawalError,
  }) {
    return withdrawalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(WithdrawalLoading value)? withdrawalLoading,
    TResult Function(WithdrawalSuccess value)? withdrawalSuccess,
    TResult Function(WithdrawalError value)? withdrawalError,
    required TResult orElse(),
  }) {
    if (withdrawalError != null) {
      return withdrawalError(this);
    }
    return orElse();
  }
}

abstract class WithdrawalError implements WithdrawBalanceStates {
  const factory WithdrawalError(final String errCode, final String err) =
      _$WithdrawalErrorImpl;

  String get errCode;
  String get err;
  @JsonKey(ignore: true)
  _$$WithdrawalErrorImplCopyWith<_$WithdrawalErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
