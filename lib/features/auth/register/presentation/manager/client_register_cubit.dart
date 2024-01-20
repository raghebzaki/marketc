import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/features/auth/register/domain/entities/register_entity.dart';

import '../../domain/use_cases/check_registered_email_usecase.dart';
import '../../domain/use_cases/register_usecase.dart';


part 'client_register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({
    required this.registerUseCase,
    required this.checkRegisteredEmailUseCase,
  }) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final RegisterUseCase registerUseCase;
  final CheckRegisteredEmailUseCase checkRegisteredEmailUseCase;

  userRegister(RegisterEntity registerEntity) async {
    emit(RegisterLoadingState());
    final register =
    await registerUseCase(registerEntity);

    register.fold(
          (l) {
        // defaultSnackBar(context,
        //     "Failed to register. Error Code: ${l.code} Error Message: ${l.message}");
        emit(
          RegisterErrorState(
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
          RegisterSuccessState(),
        );
      },
    );
  }


  checkEmail(BuildContext context, String email) async {
    emit(RegisterLoadingState());
    final checkEmail = await checkRegisteredEmailUseCase(email);
    checkEmail.fold(
          (l) => {

        emit(
          RegisterErrorState(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {

        emit(
          RegisterSuccessState(),
        ),
      },
    );
  }

}