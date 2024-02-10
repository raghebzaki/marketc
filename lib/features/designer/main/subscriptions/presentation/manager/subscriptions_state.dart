part of 'subscriptions_cubit.dart';

@freezed
class SubscriptionsStates with _$SubscriptionsStates {
  const factory SubscriptionsStates.initial() = _Initial;
  const factory SubscriptionsStates.loading() = Loading;
  const factory SubscriptionsStates.success(final List<PackageDataEntity> packages) = Success;
  const factory SubscriptionsStates.paginationLoading() = PaginationLoading;
  const factory SubscriptionsStates.paginationError(final String errCode, final String err) = PaginationError;
  const factory SubscriptionsStates.error(final String errCode, final String err) = Error;
}
