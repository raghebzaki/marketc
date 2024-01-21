import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginUseCase}) : super(const LoginStates.initial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final LoginUseCase loginUseCase;

  userLogin(LoginEntity loginEntity) async {
    emit(const LoginStates.loading());
    final login = await loginUseCase(loginEntity);

    login.fold(
      (l) {
        emit(
          LoginStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        emit(
          LoginStates.success(r),
        );
      },
    );
  }
}
