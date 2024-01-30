part of 'delete_product_cubit.dart';

@freezed
class DeleteProductState with _$DeleteProductState {
  const factory DeleteProductState.initial() = _Initial;
  const factory DeleteProductState.loading() = Loading;
  const factory DeleteProductState.success(final DeleteProductEntity deleteProductEntity) = Success;
  const factory DeleteProductState.error(final String errCode, final String err) = Error;
}
