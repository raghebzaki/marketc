part of 'search_cubit.dart';

@freezed
class SearchStates with _$SearchStates {
  const factory SearchStates.initial() = _Initial;
  const factory SearchStates.loading() = Loading;
  const factory SearchStates.success(final List<ProductEntity> products) = Success;
  const factory SearchStates.error(final String errCode, final String err) = Error;
  const factory SearchStates.paginationLoading() = PaginationLoading;
  const factory SearchStates.paginationError(final String errCode, final String err) = PaginationError;
}
