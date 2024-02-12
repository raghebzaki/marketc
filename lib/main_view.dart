import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/core/resources/api/data_sources.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/state_error_widget.dart';
import 'package:marketc/core/utils/app_images.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/auth/login/domain/entities/login_entity.dart';

import 'core/dependency_injection/di.dart' as di;
import 'core/helpers/cache_helper.dart';
import 'core/shared/arguments.dart';
import 'core/shared/cubits/internet_checker_cubit.dart';
import 'core/shared/models/user_data_model.dart';
import 'core/utils/app_colors.dart';
import 'features/auth/login/presentation/manager/login_cubit.dart';
import 'generated/l10n.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
        BlocProvider(
          create: (context) => di.di<LoginCubit>(),
        ),
      ],
      child: BlocConsumer<InternetCubit, InternetStates>(
        listener: (context, state) {
          if (state == InternetStates.gained) {
            checkOnboarding(context);
          } else if (state == InternetStates.lost) {
            context.defaultSnackBar(
              "No Internet Connection",
              color: AppColors.errorColor,
            );
          }
        },
        builder: (context, state) {
          return state == InternetStates.gained
              ? BlocConsumer<LoginCubit, LoginStates>(
                  listener: (context, state) {
                    LoginCubit loginCubit = LoginCubit.get(context);

                    state.maybeWhen(
                      // initial: () async {
                      //   var email =
                      //       await CacheHelper.getData("email") ?? "";
                      //   var pass =
                      //       await CacheHelper.getData("pass") ?? "";
                      //   if (email == null && pass == null || email == "" && pass == "") {
                      //     return null;
                      //   } else {
                      //     // loginCubit.userLogin();
                      //   }
                      // },
                      success: (state) async {
                        var email = await CacheHelper.getData("email");
                        // var pass = await CacheHelper.getData("pass");
                        if (state!.status == 1) {
                          if (context.mounted) {
                            context.defaultSnackBar(
                                S.of(context).login_successful);
                          }
                          // debugPrint("$email, $pass");
                          if (UserData.type == "customer") {
                            if (context.mounted) {
                              context.pushNamed(bottomNavBarPageRoute);
                            }
                          } else {
                            if (context.mounted) {
                              context.pushNamed(designerBottomNavBarPageRoute);
                            }
                          }
                          // UpdateFcmTokenService.updateUserToken(UserData.id!);
                        } else if (state.status == 0) {
                          if (state.msg ==
                              "Active your account first verification code sent to your email !") {
                            // await resendCodeUseCase(email.ifEmpty());
                            loginCubit.resendCode(email);
                            if (context.mounted) {
                              context.pushNamed(
                                verifyAccountPageRoute,
                                arguments: VerifyAccountArgs(email: email),
                              );
                            }
                          }
                          if (context.mounted) {
                            context.defaultSnackBar(state.msg!);
                            context.pushNamed(loginPageRoute);
                          }
                        } else {
                          if (context.mounted) {
                            context.defaultSnackBar(state.msg!);
                            context.pushNamed(loginPageRoute);
                          }
                        }
                      },
                      error: (errCode, err) {
                        context.defaultSnackBar(
                            "${S.current.err_code}: $errCode, $err");
                        context.pushNamed(loginPageRoute);
                      },
                      orElse: () {
                        return null;
                      },
                    );
                  },
                  builder: (context, state) {
                    return Scaffold(
                      body: Center(
                        child: Image.asset(AppImages.splashImg),
                      ),
                    );
                  },
                )
              : Scaffold(
                body: StateErrorWidget(
                    errCode: S.current.noInternetConnection,
                    err: DataSource.noInternetConnection.toString(),
                  ),
              );
        },
      ),
    );
  }
}

checkOnboarding(BuildContext context) async {
  var initScreen = await CacheHelper.getData("initScreen");

  if (initScreen == null) {
    if (context.mounted) {
      context.pushNamed(onBoardingPageRoute);
    }
  } else {
    if (context.mounted) {
      checkRememberMe(context);
    }
  }
}

checkRememberMe(BuildContext context) async {
  var email = await CacheHelper.getData("email");
  var pass = await CacheHelper.getData("pass");

  if (context.mounted) {
    LoginCubit loginCubit = LoginCubit.get(context);
    if (email == null && pass == null) {
      context.pushNamed(loginPageRoute);
    } else {
      loginCubit.userLogin(
        LoginEntity(
          userName: email,
          pass: pass,
        ),
      );
    }
  }
}
