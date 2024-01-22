part of 'promo_code_cubit.dart';

@freezed
class PromoCodeState with _$PromoCodeState {
  const factory PromoCodeState.initial() = _Initial;
  const factory PromoCodeState.loading() = Loading;
  const factory PromoCodeState.success(final PromoCodeEntity? promoCodeEntity) = Success;
  const factory PromoCodeState.error(final String? errCode, final String? err) = Error;
}
