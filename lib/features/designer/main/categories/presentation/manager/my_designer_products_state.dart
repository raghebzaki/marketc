part of 'my_designer_products_cubit.dart';

@freezed
class MyDesignerProductsStates with _$MyDesignerProductsStates {
  const factory MyDesignerProductsStates.initial() = _Initial;
  const factory MyDesignerProductsStates.loading() = Loading;
  const factory MyDesignerProductsStates.success(final MyDesignerProductsEntity products) = Success;
  const factory MyDesignerProductsStates.paginationLoading() = PaginationLoading;
  const factory MyDesignerProductsStates.paginationError(final String errCode, final String err) = PaginationError;
  const factory MyDesignerProductsStates.error(final String errCode, final String err) = Error;
}
