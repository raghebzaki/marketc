part of 'promo_code_cubit.dart';

@freezed
class PromoCodeState with _$PromoCodeState {
  const factory PromoCodeState.initial() = _Initial;
  const factory PromoCodeState.promoLoading() = PromoLoading;
  const factory PromoCodeState.promoSuccess(final PromoCodeEntity? promoCodeEntity) = PromoSuccess;
  const factory PromoCodeState.promoError(final String? errCode, final String? err) = PromoError;
}
