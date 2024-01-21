part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.success(final FavoriteEntity? favoriteEntity) = Success;
  const factory FavoriteState.error(final String? errCode, final String? err) = Error;
  const factory FavoriteState.paginationLoading() = PaginationLoading;
  const factory FavoriteState.paginationError(final String? errCode, final String? err) = PaginationSuccess;
}
