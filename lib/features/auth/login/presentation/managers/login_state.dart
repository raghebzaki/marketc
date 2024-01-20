

part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loding;
  const factory LoginState.success() = Success;
  const factory LoginState.error(final String errCode, final String err) = Error;
}
