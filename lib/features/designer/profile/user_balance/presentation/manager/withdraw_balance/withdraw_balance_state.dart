part of 'withdraw_balance_cubit.dart';

@freezed
class WithdrawBalanceStates with _$WithdrawBalanceStates {
  const factory WithdrawBalanceStates.initial() = _Initial;
  const factory WithdrawBalanceStates.withdrawalLoading() = WithdrawalLoading;
  const factory WithdrawBalanceStates.withdrawalSuccess(final UserBalanceEntity withdrawal) = WithdrawalSuccess;
  const factory WithdrawBalanceStates.withdrawalError(final String errCode, final String err) = WithdrawalError;
}
