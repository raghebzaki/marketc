part of 'cancel_order_cubit.dart';

@freezed
class CancelOrderStates with _$CancelOrderStates {
  const factory CancelOrderStates.initial() = _Initial;
  const factory CancelOrderStates.loading() = Loading;
  const factory CancelOrderStates.success(final CancelOrderEntity cancelOrder) = Success;
  const factory CancelOrderStates.error(final String errCode, final String err) = Error;
}
