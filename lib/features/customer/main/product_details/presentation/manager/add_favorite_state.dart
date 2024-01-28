part of 'add_favorite_cubit.dart';

@freezed
class AddFavoriteStates with _$AddFavoriteStates {
  const factory AddFavoriteStates.initial() = _Initial;
  const factory AddFavoriteStates.loading() = Loading;
  const factory AddFavoriteStates.success(final AddFavoriteEntity favorite) = Success;
  const factory AddFavoriteStates.error(final String errCode, final String err) = Error;
}
