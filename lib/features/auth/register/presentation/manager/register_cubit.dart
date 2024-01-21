import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/register_entity.dart';
import '../../domain/use_cases/check_registered_email_usecase.dart';
import '../../domain/use_cases/register_usecase.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase, required this.checkRegisteredEmailUseCase}) : super(const RegisterState.initial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final RegisterUseCase registerUseCase;
  final CheckRegisteredEmailUseCase checkRegisteredEmailUseCase;

  userRegister(RegisterEntity registerEntity) async {
    emit(const RegisterState.loading());
    final register =
    await registerUseCase(registerEntity);

    register.fold(
          (l) {
        // defaultSnackBar(context,
        //     "Failed to register. Error Code: ${l.code} Error Message: ${l.message}");
        emit(
          RegisterState.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
          (r) {
        // if (r.status == 1) {
        //   defaultSnackBar(context, "Registered Successfully");
        //   context.pushNamed(verifyPageRoute);
        // } else {
        //   defaultSnackBar(context, "Something went wrong while registering");
        // }
        emit(
          RegisterState.success(registerEntity),
        );
      },
    );
  }


  checkEmail(BuildContext context, String email) async {
    emit(const RegisterState.loading());
    final checkEmail = await checkRegisteredEmailUseCase(email);
    checkEmail.fold(
          (l) => {

        emit(
          RegisterState.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {

        emit(
          RegisterState.checkEmailSuccess(r),
        ),
      },
    );
  }

}
