part of 'new_products_cubit.dart';

@freezed
class NewProductsState with _$NewProductsState {
  const factory NewProductsState.initial() = _Initial;
  const factory NewProductsState.loading() = Loading;
  const factory NewProductsState.success(final List<ProductEntity>? productEntity) = Success;
  const factory NewProductsState.error(final String? errCode, final String? err) = Error;
  const factory NewProductsState.paginationLoading() = PaginationLoading;
  const factory NewProductsState.paginationError(final String? errCode, final String? err) = PaginationSuccess;
}
