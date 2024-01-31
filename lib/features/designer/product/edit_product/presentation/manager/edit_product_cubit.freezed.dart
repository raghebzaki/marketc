// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProductStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EditProductEntity editProduct) success,
    required TResult Function(String errCode, String err) error,
    required TResult Function(XFile image) uploadImage,
    required TResult Function(List<XFile> images) uploadMultipleImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EditProductEntity editProduct)? success,
    TResult? Function(String errCode, String err)? error,
    TResult? Function(XFile image)? uploadImage,
    TResult? Function(List<XFile> images)? uploadMultipleImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EditProductEntity editProduct)? success,
    TResult Function(String errCode, String err)? error,
    TResult Function(XFile image)? uploadImage,
    TResult Function(List<XFile> images)? uploadMultipleImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(UploadImage value) uploadImage,
    required TResult Function(UploadMultipleImages value) uploadMultipleImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(UploadImage value)? uploadImage,
    TResult? Function(UploadMultipleImages value)? uploadMultipleImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(UploadImage value)? uploadImage,
    TResult Function(UploadMultipleImages value)? uploadMultipleImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProductStatesCopyWith<$Res> {
  factory $EditProductStatesCopyWith(
          EditProductStates value, $Res Function(EditProductStates) then) =
      _$EditProductStatesCopyWithImpl<$Res, EditProductStates>;
}

/// @nodoc
class _$EditProductStatesCopyWithImpl<$Res, $Val extends EditProductStates>
    implements $EditProductStatesCopyWith<$Res> {
  _$EditProductStatesCopyWithImpl(this._value, this._then);

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
    extends _$EditProductStatesCopyWithImpl<$Res, _$InitialImpl>
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
    return 'EditProductStates.initial()';
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
    required TResult Function(EditProductEntity editProduct) success,
    required TResult Function(String errCode, String err) error,
    required TResult Function(XFile image) uploadImage,
    required TResult Function(List<XFile> images) uploadMultipleImages,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EditProductEntity editProduct)? success,
    TResult? Function(String errCode, String err)? error,
    TResult? Function(XFile image)? uploadImage,
    TResult? Function(List<XFile> images)? uploadMultipleImages,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EditProductEntity editProduct)? success,
    TResult Function(String errCode, String err)? error,
    TResult Function(XFile image)? uploadImage,
    TResult Function(List<XFile> images)? uploadMultipleImages,
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
    required TResult Function(Error value) error,
    required TResult Function(UploadImage value) uploadImage,
    required TResult Function(UploadMultipleImages value) uploadMultipleImages,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(UploadImage value)? uploadImage,
    TResult? Function(UploadMultipleImages value)? uploadMultipleImages,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(UploadImage value)? uploadImage,
    TResult Function(UploadMultipleImages value)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EditProductStates {
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
    extends _$EditProductStatesCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'EditProductStates.loading()';
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
    required TResult Function(EditProductEntity editProduct) success,
    required TResult Function(String errCode, String err) error,
    required TResult Function(XFile image) uploadImage,
    required TResult Function(List<XFile> images) uploadMultipleImages,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EditProductEntity editProduct)? success,
    TResult? Function(String errCode, String err)? error,
    TResult? Function(XFile image)? uploadImage,
    TResult? Function(List<XFile> images)? uploadMultipleImages,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EditProductEntity editProduct)? success,
    TResult Function(String errCode, String err)? error,
    TResult Function(XFile image)? uploadImage,
    TResult Function(List<XFile> images)? uploadMultipleImages,
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
    required TResult Function(Error value) error,
    required TResult Function(UploadImage value) uploadImage,
    required TResult Function(UploadMultipleImages value) uploadMultipleImages,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(UploadImage value)? uploadImage,
    TResult? Function(UploadMultipleImages value)? uploadMultipleImages,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(UploadImage value)? uploadImage,
    TResult Function(UploadMultipleImages value)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements EditProductStates {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EditProductEntity editProduct});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$EditProductStatesCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editProduct = null,
  }) {
    return _then(_$SuccessImpl(
      null == editProduct
          ? _value.editProduct
          : editProduct // ignore: cast_nullable_to_non_nullable
              as EditProductEntity,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(this.editProduct);

  @override
  final EditProductEntity editProduct;

  @override
  String toString() {
    return 'EditProductStates.success(editProduct: $editProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.editProduct, editProduct) ||
                other.editProduct == editProduct));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editProduct);

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
    required TResult Function(EditProductEntity editProduct) success,
    required TResult Function(String errCode, String err) error,
    required TResult Function(XFile image) uploadImage,
    required TResult Function(List<XFile> images) uploadMultipleImages,
  }) {
    return success(editProduct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EditProductEntity editProduct)? success,
    TResult? Function(String errCode, String err)? error,
    TResult? Function(XFile image)? uploadImage,
    TResult? Function(List<XFile> images)? uploadMultipleImages,
  }) {
    return success?.call(editProduct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EditProductEntity editProduct)? success,
    TResult Function(String errCode, String err)? error,
    TResult Function(XFile image)? uploadImage,
    TResult Function(List<XFile> images)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(editProduct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(UploadImage value) uploadImage,
    required TResult Function(UploadMultipleImages value) uploadMultipleImages,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(UploadImage value)? uploadImage,
    TResult? Function(UploadMultipleImages value)? uploadMultipleImages,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(UploadImage value)? uploadImage,
    TResult Function(UploadMultipleImages value)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements EditProductStates {
  const factory Success(final EditProductEntity editProduct) = _$SuccessImpl;

  EditProductEntity get editProduct;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$EditProductStatesCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'EditProductStates.error(errCode: $errCode, err: $err)';
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
    required TResult Function(EditProductEntity editProduct) success,
    required TResult Function(String errCode, String err) error,
    required TResult Function(XFile image) uploadImage,
    required TResult Function(List<XFile> images) uploadMultipleImages,
  }) {
    return error(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EditProductEntity editProduct)? success,
    TResult? Function(String errCode, String err)? error,
    TResult? Function(XFile image)? uploadImage,
    TResult? Function(List<XFile> images)? uploadMultipleImages,
  }) {
    return error?.call(errCode, err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EditProductEntity editProduct)? success,
    TResult Function(String errCode, String err)? error,
    TResult Function(XFile image)? uploadImage,
    TResult Function(List<XFile> images)? uploadMultipleImages,
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
    required TResult Function(Error value) error,
    required TResult Function(UploadImage value) uploadImage,
    required TResult Function(UploadMultipleImages value) uploadMultipleImages,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(UploadImage value)? uploadImage,
    TResult? Function(UploadMultipleImages value)? uploadMultipleImages,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(UploadImage value)? uploadImage,
    TResult Function(UploadMultipleImages value)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements EditProductStates {
  const factory Error(final String errCode, final String err) = _$ErrorImpl;

  String get errCode;
  String get err;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadImageImplCopyWith<$Res> {
  factory _$$UploadImageImplCopyWith(
          _$UploadImageImpl value, $Res Function(_$UploadImageImpl) then) =
      __$$UploadImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image});
}

/// @nodoc
class __$$UploadImageImplCopyWithImpl<$Res>
    extends _$EditProductStatesCopyWithImpl<$Res, _$UploadImageImpl>
    implements _$$UploadImageImplCopyWith<$Res> {
  __$$UploadImageImplCopyWithImpl(
      _$UploadImageImpl _value, $Res Function(_$UploadImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$UploadImageImpl(
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$UploadImageImpl implements UploadImage {
  const _$UploadImageImpl(this.image);

  @override
  final XFile image;

  @override
  String toString() {
    return 'EditProductStates.uploadImage(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImageImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImageImplCopyWith<_$UploadImageImpl> get copyWith =>
      __$$UploadImageImplCopyWithImpl<_$UploadImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EditProductEntity editProduct) success,
    required TResult Function(String errCode, String err) error,
    required TResult Function(XFile image) uploadImage,
    required TResult Function(List<XFile> images) uploadMultipleImages,
  }) {
    return uploadImage(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EditProductEntity editProduct)? success,
    TResult? Function(String errCode, String err)? error,
    TResult? Function(XFile image)? uploadImage,
    TResult? Function(List<XFile> images)? uploadMultipleImages,
  }) {
    return uploadImage?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EditProductEntity editProduct)? success,
    TResult Function(String errCode, String err)? error,
    TResult Function(XFile image)? uploadImage,
    TResult Function(List<XFile> images)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(UploadImage value) uploadImage,
    required TResult Function(UploadMultipleImages value) uploadMultipleImages,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(UploadImage value)? uploadImage,
    TResult? Function(UploadMultipleImages value)? uploadMultipleImages,
  }) {
    return uploadImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(UploadImage value)? uploadImage,
    TResult Function(UploadMultipleImages value)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(this);
    }
    return orElse();
  }
}

abstract class UploadImage implements EditProductStates {
  const factory UploadImage(final XFile image) = _$UploadImageImpl;

  XFile get image;
  @JsonKey(ignore: true)
  _$$UploadImageImplCopyWith<_$UploadImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadMultipleImagesImplCopyWith<$Res> {
  factory _$$UploadMultipleImagesImplCopyWith(_$UploadMultipleImagesImpl value,
          $Res Function(_$UploadMultipleImagesImpl) then) =
      __$$UploadMultipleImagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<XFile> images});
}

/// @nodoc
class __$$UploadMultipleImagesImplCopyWithImpl<$Res>
    extends _$EditProductStatesCopyWithImpl<$Res, _$UploadMultipleImagesImpl>
    implements _$$UploadMultipleImagesImplCopyWith<$Res> {
  __$$UploadMultipleImagesImplCopyWithImpl(_$UploadMultipleImagesImpl _value,
      $Res Function(_$UploadMultipleImagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$UploadMultipleImagesImpl(
      null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ));
  }
}

/// @nodoc

class _$UploadMultipleImagesImpl implements UploadMultipleImages {
  const _$UploadMultipleImagesImpl(final List<XFile> images) : _images = images;

  final List<XFile> _images;
  @override
  List<XFile> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'EditProductStates.uploadMultipleImages(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadMultipleImagesImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadMultipleImagesImplCopyWith<_$UploadMultipleImagesImpl>
      get copyWith =>
          __$$UploadMultipleImagesImplCopyWithImpl<_$UploadMultipleImagesImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EditProductEntity editProduct) success,
    required TResult Function(String errCode, String err) error,
    required TResult Function(XFile image) uploadImage,
    required TResult Function(List<XFile> images) uploadMultipleImages,
  }) {
    return uploadMultipleImages(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EditProductEntity editProduct)? success,
    TResult? Function(String errCode, String err)? error,
    TResult? Function(XFile image)? uploadImage,
    TResult? Function(List<XFile> images)? uploadMultipleImages,
  }) {
    return uploadMultipleImages?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EditProductEntity editProduct)? success,
    TResult Function(String errCode, String err)? error,
    TResult Function(XFile image)? uploadImage,
    TResult Function(List<XFile> images)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (uploadMultipleImages != null) {
      return uploadMultipleImages(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(UploadImage value) uploadImage,
    required TResult Function(UploadMultipleImages value) uploadMultipleImages,
  }) {
    return uploadMultipleImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(UploadImage value)? uploadImage,
    TResult? Function(UploadMultipleImages value)? uploadMultipleImages,
  }) {
    return uploadMultipleImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(UploadImage value)? uploadImage,
    TResult Function(UploadMultipleImages value)? uploadMultipleImages,
    required TResult orElse(),
  }) {
    if (uploadMultipleImages != null) {
      return uploadMultipleImages(this);
    }
    return orElse();
  }
}

abstract class UploadMultipleImages implements EditProductStates {
  const factory UploadMultipleImages(final List<XFile> images) =
      _$UploadMultipleImagesImpl;

  List<XFile> get images;
  @JsonKey(ignore: true)
  _$$UploadMultipleImagesImplCopyWith<_$UploadMultipleImagesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
