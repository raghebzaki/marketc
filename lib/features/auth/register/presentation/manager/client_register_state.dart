part of 'client_register_cubit.dart';

abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String? errorCode;
  final String? error;

  RegisterErrorState(this.errorCode, this.error);
}

class EmailValidState extends RegisterStates {}
