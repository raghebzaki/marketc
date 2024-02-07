part of 'balance_cubit.dart';

@freezed
class BalanceState with _$BalanceState {
  const factory BalanceState.initial() = _Initial;
  const factory BalanceState.loading() = Loading;
  const factory BalanceState.success(final BalanceEntity? balanceEntity) = Success;
  const factory BalanceState.error(final String? errCode, final String? err) = Error;
}
