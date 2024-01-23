// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_designer_products_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyDesignerProductsStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MyDesignerProductsEntity products) success,
    required TResult Function(MyDesignerProductsEntity products)
        paginationLoading,
    required TResult Function(MyDesignerProductsEntity products)
        paginationError,
    required TResult Function(String errCode, String err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MyDesignerProductsEntity products)? success,
    TResult? Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult? Function(MyDesignerProductsEntity products)? paginationError,
    TResult? Function(String errCode, String err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MyDesignerProductsEntity products)? success,
    TResult Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult Function(MyDesignerProductsEntity products)? paginationError,
    TResult Function(String errCode, String err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(PaginationLoading value) paginationLoading,
    required TResult Function(PaginationError value) paginationError,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(PaginationLoading value)? paginationLoading,
    TResult? Function(PaginationError value)? paginationError,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(PaginationLoading value)? paginationLoading,
    TResult Function(PaginationError value)? paginationError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDesignerProductsStatesCopyWith<$Res> {
  factory $MyDesignerProductsStatesCopyWith(MyDesignerProductsStates value,
          $Res Function(MyDesignerProductsStates) then) =
      _$MyDesignerProductsStatesCopyWithImpl<$Res, MyDesignerProductsStates>;
}

/// @nodoc
class _$MyDesignerProductsStatesCopyWithImpl<$Res,
        $Val extends MyDesignerProductsStates>
    implements $MyDesignerProductsStatesCopyWith<$Res> {
  _$MyDesignerProductsStatesCopyWithImpl(this._value, this._then);

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
    extends _$MyDesignerProductsStatesCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MyDesignerProductsStates.initial()';
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
    required TResult Function() loading,
    required TResult Function(MyDesignerProductsEntity products) success,
    required TResult Function(MyDesignerProductsEntity products)
        paginationLoading,
    required TResult Function(MyDesignerProductsEntity products)
        paginationError,
    required TResult Function(String errCode, String err) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MyDesignerProductsEntity products)? success,
    TResult? Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult? Function(MyDesignerProductsEntity products)? paginationError,
    TResult? Function(String errCode, String err)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MyDesignerProductsEntity products)? success,
    TResult Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult Function(MyDesignerProductsEntity products)? paginationError,
    TResult Function(String errCode, String err)? error,
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
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(PaginationLoading value) paginationLoading,
    required TResult Function(PaginationError value) paginationError,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(PaginationLoading value)? paginationLoading,
    TResult? Function(PaginationError value)? paginationError,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(PaginationLoading value)? paginationLoading,
    TResult Function(PaginationError value)? paginationError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MyDesignerProductsStates {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MyDesignerProductsStatesCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MyDesignerProductsStates.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MyDesignerProductsEntity products) success,
    required TResult Function(MyDesignerProductsEntity products)
        paginationLoading,
    required TResult Function(MyDesignerProductsEntity products)
        paginationError,
    required TResult Function(String errCode, String err) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MyDesignerProductsEntity products)? success,
    TResult? Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult? Function(MyDesignerProductsEntity products)? paginationError,
    TResult? Function(String errCode, String err)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MyDesignerProductsEntity products)? success,
    TResult Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult Function(MyDesignerProductsEntity products)? paginationError,
    TResult Function(String errCode, String err)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(PaginationLoading value) paginationLoading,
    required TResult Function(PaginationError value) paginationError,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(PaginationLoading value)? paginationLoading,
    TResult? Function(PaginationError value)? paginationError,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(PaginationLoading value)? paginationLoading,
    TResult Function(PaginationError value)? paginationError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements MyDesignerProductsStates {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyDesignerProductsEntity products});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MyDesignerProductsStatesCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$SuccessImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as MyDesignerProductsEntity,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(this.products);

  @override
  final MyDesignerProductsEntity products;

  @override
  String toString() {
    return 'MyDesignerProductsStates.success(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MyDesignerProductsEntity products) success,
    required TResult Function(MyDesignerProductsEntity products)
        paginationLoading,
    required TResult Function(MyDesignerProductsEntity products)
        paginationError,
    required TResult Function(String errCode, String err) error,
  }) {
    return success(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MyDesignerProductsEntity products)? success,
    TResult? Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult? Function(MyDesignerProductsEntity products)? paginationError,
    TResult? Function(String errCode, String err)? error,
  }) {
    return success?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MyDesignerProductsEntity products)? success,
    TResult Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult Function(MyDesignerProductsEntity products)? paginationError,
    TResult Function(String errCode, String err)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(PaginationLoading value) paginationLoading,
    required TResult Function(PaginationError value) paginationError,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(PaginationLoading value)? paginationLoading,
    TResult? Function(PaginationError value)? paginationError,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(PaginationLoading value)? paginationLoading,
    TResult Function(PaginationError value)? paginationError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements MyDesignerProductsStates {
  const factory Success(final MyDesignerProductsEntity products) =
      _$SuccessImpl;

  MyDesignerProductsEntity get products;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaginationLoadingImplCopyWith<$Res> {
  factory _$$PaginationLoadingImplCopyWith(_$PaginationLoadingImpl value,
          $Res Function(_$PaginationLoadingImpl) then) =
      __$$PaginationLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyDesignerProductsEntity products});
}

/// @nodoc
class __$$PaginationLoadingImplCopyWithImpl<$Res>
    extends _$MyDesignerProductsStatesCopyWithImpl<$Res,
        _$PaginationLoadingImpl>
    implements _$$PaginationLoadingImplCopyWith<$Res> {
  __$$PaginationLoadingImplCopyWithImpl(_$PaginationLoadingImpl _value,
      $Res Function(_$PaginationLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$PaginationLoadingImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as MyDesignerProductsEntity,
    ));
  }
}

/// @nodoc

class _$PaginationLoadingImpl implements PaginationLoading {
  const _$PaginationLoadingImpl(this.products);

  @override
  final MyDesignerProductsEntity products;

  @override
  String toString() {
    return 'MyDesignerProductsStates.paginationLoading(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationLoadingImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationLoadingImplCopyWith<_$PaginationLoadingImpl> get copyWith =>
      __$$PaginationLoadingImplCopyWithImpl<_$PaginationLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MyDesignerProductsEntity products) success,
    required TResult Function(MyDesignerProductsEntity products)
        paginationLoading,
    required TResult Function(MyDesignerProductsEntity products)
        paginationError,
    required TResult Function(String errCode, String err) error,
  }) {
    return paginationLoading(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MyDesignerProductsEntity products)? success,
    TResult? Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult? Function(MyDesignerProductsEntity products)? paginationError,
    TResult? Function(String errCode, String err)? error,
  }) {
    return paginationLoading?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MyDesignerProductsEntity products)? success,
    TResult Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult Function(MyDesignerProductsEntity products)? paginationError,
    TResult Function(String errCode, String err)? error,
    required TResult orElse(),
  }) {
    if (paginationLoading != null) {
      return paginationLoading(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(PaginationLoading value) paginationLoading,
    required TResult Function(PaginationError value) paginationError,
    required TResult Function(Error value) error,
  }) {
    return paginationLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(PaginationLoading value)? paginationLoading,
    TResult? Function(PaginationError value)? paginationError,
    TResult? Function(Error value)? error,
  }) {
    return paginationLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(PaginationLoading value)? paginationLoading,
    TResult Function(PaginationError value)? paginationError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (paginationLoading != null) {
      return paginationLoading(this);
    }
    return orElse();
  }
}

abstract class PaginationLoading implements MyDesignerProductsStates {
  const factory PaginationLoading(final MyDesignerProductsEntity products) =
      _$PaginationLoadingImpl;

  MyDesignerProductsEntity get products;
  @JsonKey(ignore: true)
  _$$PaginationLoadingImplCopyWith<_$PaginationLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaginationErrorImplCopyWith<$Res> {
  factory _$$PaginationErrorImplCopyWith(_$PaginationErrorImpl value,
          $Res Function(_$PaginationErrorImpl) then) =
      __$$PaginationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyDesignerProductsEntity products});
}

/// @nodoc
class __$$PaginationErrorImplCopyWithImpl<$Res>
    extends _$MyDesignerProductsStatesCopyWithImpl<$Res, _$PaginationErrorImpl>
    implements _$$PaginationErrorImplCopyWith<$Res> {
  __$$PaginationErrorImplCopyWithImpl(
      _$PaginationErrorImpl _value, $Res Function(_$PaginationErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$PaginationErrorImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as MyDesignerProductsEntity,
    ));
  }
}

/// @nodoc

class _$PaginationErrorImpl implements PaginationError {
  const _$PaginationErrorImpl(this.products);

  @override
  final MyDesignerProductsEntity products;

  @override
  String toString() {
    return 'MyDesignerProductsStates.paginationError(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationErrorImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationErrorImplCopyWith<_$PaginationErrorImpl> get copyWith =>
      __$$PaginationErrorImplCopyWithImpl<_$PaginationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MyDesignerProductsEntity products) success,
    required TResult Function(MyDesignerProductsEntity products)
        paginationLoading,
    required TResult Function(MyDesignerProductsEntity products)
        paginationError,
    required TResult Function(String errCode, String err) error,
  }) {
    return paginationError(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MyDesignerProductsEntity products)? success,
    TResult? Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult? Function(MyDesignerProductsEntity products)? paginationError,
    TResult? Function(String errCode, String err)? error,
  }) {
    return paginationError?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MyDesignerProductsEntity products)? success,
    TResult Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult Function(MyDesignerProductsEntity products)? paginationError,
    TResult Function(String errCode, String err)? error,
    required TResult orElse(),
  }) {
    if (paginationError != null) {
      return paginationError(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(PaginationLoading value) paginationLoading,
    required TResult Function(PaginationError value) paginationError,
    required TResult Function(Error value) error,
  }) {
    return paginationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(PaginationLoading value)? paginationLoading,
    TResult? Function(PaginationError value)? paginationError,
    TResult? Function(Error value)? error,
  }) {
    return paginationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(PaginationLoading value)? paginationLoading,
    TResult Function(PaginationError value)? paginationError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (paginationError != null) {
      return paginationError(this);
    }
    return orElse();
  }
}

abstract class PaginationError implements MyDesignerProductsStates {
  const factory PaginationError(final MyDesignerProductsEntity products) =
      _$PaginationErrorImpl;

  MyDesignerProductsEntity get products;
  @JsonKey(ignore: true)
  _$$PaginationErrorImplCopyWith<_$PaginationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errCode, String err});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MyDesignerProductsStatesCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errCode = null,
    Object? err = null,
  }) {
    return _then(_$ErrorImpl(
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

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.errCode, this.err);

  @override
  final String errCode;
  @override
  final String err;

  @override
  String toString() {
    return 'MyDesignerProductsStates.error(errCode: $errCode, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errCode, errCode) || other.errCode == errCode) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errCode, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MyDesignerProductsEntity products) success,
    required TResult Function(MyDesignerProductsEntity products)
        paginationLoading,
    required TResult Function(MyDesignerProductsEntity products)
        paginationError,
    required TResult Function(String errCode, String err) error,
  }) {
    return error(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MyDesignerProductsEntity products)? success,
    TResult? Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult? Function(MyDesignerProductsEntity products)? paginationError,
    TResult? Function(String errCode, String err)? error,
  }) {
    return error?.call(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MyDesignerProductsEntity products)? success,
    TResult Function(MyDesignerProductsEntity products)? paginationLoading,
    TResult Function(MyDesignerProductsEntity products)? paginationError,
    TResult Function(String errCode, String err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errCode, err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(PaginationLoading value) paginationLoading,
    required TResult Function(PaginationError value) paginationError,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(PaginationLoading value)? paginationLoading,
    TResult? Function(PaginationError value)? paginationError,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(PaginationLoading value)? paginationLoading,
    TResult Function(PaginationError value)? paginationError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MyDesignerProductsStates {
  const factory Error(final String errCode, final String err) = _$ErrorImpl;

  String get errCode;
  String get err;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}