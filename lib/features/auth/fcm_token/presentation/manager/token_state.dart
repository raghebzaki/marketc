part of 'token_cubit.dart';

@freezed
class TokenStates with _$TokenStates {
  const factory TokenStates.initial() = _Initial;
  const factory TokenStates.loading() = Loading;
  const factory TokenStates.success(final TokenEntity token) = Success;
  const factory TokenStates.error(final String errCode, final String err) = Error;
}
