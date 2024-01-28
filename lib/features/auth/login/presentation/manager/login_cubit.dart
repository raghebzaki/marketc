import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/auth/verify_account/domain/use_cases/resend_code_usecase.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/arguments.dart';
import '../../../../../core/shared/models/user_data_model.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(
      {required this.loginUseCase, required this.verifyResendCodeUseCase})
      : super(const LoginStates.initial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final LoginUseCase loginUseCase;

  userLogin(LoginEntity loginEntity,BuildContext context) async {
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
        if (r.status == 1) {
          context.defaultSnackBar(S.of(context).login_successful);
          var email = CacheHelper.setData("email", emailCtrl.text);
          var pass = CacheHelper.setData("pass", passCtrl.text);
          debugPrint("$email, $pass");
          if (UserData.type == "customer") {
            context.pushNamed(bottomNavBarPageRoute);
          } else {
            context.pushNamed(designerBottomNavBarPageRoute);
          }
          // UpdateFcmTokenService.updateUserToken(UserData.id!);
        } else if (r.status == 0) {
          if (r.msg ==
              "Active your account first verification code sent to your email !") {
            // await resendCodeUseCase(email.ifEmpty());
            resendCode(emailCtrl.text);
            context.pushNamed(
              verifyAccountPageRoute,
              arguments:
              VerifyAccountArgs(email: emailCtrl.text),
            );
          }
          context.defaultSnackBar(r.msg!);
        } else {
          context.defaultSnackBar(r.msg!);
        }
      },
    );
  }

  rememberMeService(BuildContext context) async {
    String email = await CacheHelper.getData("email");
    String pass = await CacheHelper.getData("pass");

    userLogin(
      LoginEntity(
        userName: email,
        pass: pass,
      ),context
      ,
    );
  }

  final VerifyResendCodeUseCase verifyResendCodeUseCase;

  resendCode(String email) async {
    final resentOtp = await verifyResendCodeUseCase(email);

    resentOtp.fold(
      (l) => {
        emit(
          LoginStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {},
    );
  }

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
}
