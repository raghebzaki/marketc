part of 'check_if_favorite_cubit.dart';

@freezed
class CheckIfFavoriteState with _$CheckIfFavoriteState {
  const factory CheckIfFavoriteState.initial() = _Initial;
  const factory CheckIfFavoriteState.loading() = Loading;
  const factory CheckIfFavoriteState.success(final AddFavoriteEntity favorite) = Success;
  const factory CheckIfFavoriteState.error(final String errCode, final String err) = Error;
}
