part of 'get_balance_cubit.dart';

@freezed
class GetBalanceStates with _$GetBalanceStates {
  const factory GetBalanceStates.initial() = _Initial;
  const factory GetBalanceStates.getBalanceLoading() = GetBalanceLoading;
  const factory GetBalanceStates.getBalanceSuccess(final List<UserBalanceEntity> balance) = GetBalanceSuccess;
  const factory GetBalanceStates.getBalanceError(final String errCode, final String err) = GetBalanceError;
}
