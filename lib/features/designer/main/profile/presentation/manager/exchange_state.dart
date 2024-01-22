part of 'exchange_cubit.dart';

@freezed
class ExchangeState with _$ExchangeState {
  const factory ExchangeState.initial() = _Initial;
  const factory ExchangeState.loading() = Loading;
  const factory ExchangeState.success(final ExchangeEntity? exchangeEntity) = Success;
  const factory ExchangeState.error(final String? errCode, final String? err) = Error;
}
