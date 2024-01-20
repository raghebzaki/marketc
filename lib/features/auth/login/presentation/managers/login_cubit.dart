import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/auth/login/domain/entities/login_entity.dart';
import '../../../../../core/router/router.dart';
import '../../domain/use_cases/login_use_case.dart';


import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase,}) : super(const LoginState.initial());


  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginUseCase loginUseCase;

  userLogin(BuildContext context,LoginEntity loginEntity) async {
    emit(const LoginState.loading());
    final login = await loginUseCase(loginEntity);

    login.fold(
      (l) {
        context.defaultSnackBar(
            "Failed to Login. Error Code: ${l.code} Error Message: ${l.message}");
        emit(
          LoginState.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        if (r.status == 1) {
          context.defaultSnackBar("Login Successful");
         context.pushNamed(homePageRoute);
        } else if (r.status == 0) {
          if (r.msg == "Active your account first verification code sent to your email !") {
            // await resendCodeUseCase(email);
            // context.pushNamed(verifyAccountPageRoute);
          }
          context.defaultSnackBar( r.msg!);
        } else {
          context.defaultSnackBar( r.msg!);
        }
        emit(
          const LoginState.success(),
        );
      },
    );
  }
}



