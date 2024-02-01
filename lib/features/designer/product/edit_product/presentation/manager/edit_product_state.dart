part of 'edit_product_cubit.dart';

@freezed
class EditProductStates with _$EditProductStates {
  const factory EditProductStates.initial() = _Initial;
  const factory EditProductStates.loading() = Loading;
  const factory EditProductStates.success(final EditProductEntity editProduct) = Success;
  const factory EditProductStates.error(final String errCode, final String err) = Error;
  const factory EditProductStates.uploadImage(final XFile image) = UploadImage;
  const factory EditProductStates.uploadMultipleImages(final List<String> images) = UploadMultipleImages;
  const factory EditProductStates.previewImages(final List<String> previews) = PreviewImages;
}
