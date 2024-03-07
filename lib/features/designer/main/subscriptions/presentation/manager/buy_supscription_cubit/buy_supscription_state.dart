part of 'buy_supscription_cubit.dart';

@freezed
class BuySubscriptionStates with _$BuySubscriptionStates {
  const factory BuySubscriptionStates.initial() = _Initial;
  const factory BuySubscriptionStates.loading() = Loading;
  const factory BuySubscriptionStates.success(final BuySubscriptionEntity subscriptionEntity) = Success;
  const factory BuySubscriptionStates.error(final String errCode, final String err) = Error;
}
