part of 'category_details_cubit.dart';

@freezed
class CategoryDetailsStates with _$CategoryDetailsStates {
  const factory CategoryDetailsStates.initial() = _Initial;
  const factory CategoryDetailsStates.loading() = Loading;
  const factory CategoryDetailsStates.success(final CategoryDetailsEntity categoryDetails) = Success;
  const factory CategoryDetailsStates.paginationLoading() = PaginationLoading;
  const factory CategoryDetailsStates.paginationError(final String errCode, final String err) = PaginationError;
  const factory CategoryDetailsStates.error(final String errCode, final String err) = Error;
}
