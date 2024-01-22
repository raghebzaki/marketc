part of 'most_popular_cubit.dart';

@freezed
class MostPopularState with _$MostPopularState {
  const factory MostPopularState.initial() = _Initial;
  const factory MostPopularState.loading() = Loading;
  const factory MostPopularState.success(final List<ProductEntity>? productEntity) = Success;
  const factory MostPopularState.error(final String? errCode, final String? err) = Error;
  const factory MostPopularState.paginationLoading() = PaginationLoading;
  const factory MostPopularState.paginationError(final String? errCode, final String? err) = PaginationSuccess;

}
