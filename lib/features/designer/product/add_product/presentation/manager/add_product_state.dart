part of 'add_product_cubit.dart';

@freezed
class AddProductStates with _$AddProductStates {
  const factory AddProductStates.initial() = _Initial;
  const factory AddProductStates.loading() = Loading;
  const factory AddProductStates.success(final AddProductEntity addProduct) = Success;
  const factory AddProductStates.error(final String errCode, final String err) = Error;
  const factory AddProductStates.uploadImage(final XFile image) = UploadImage;
  const factory AddProductStates.uploadMultipleImages(final List<XFile> images) = UploadMultipleImages;
}
