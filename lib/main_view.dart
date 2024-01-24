import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/utils/app_images.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/auth/login/domain/entities/login_entity.dart';

import 'core/dependency_injection/di.dart' as di;
import 'core/helpers/cache_helper.dart';
import 'core/shared/cubits/internet_checker_cubit.dart';
import 'core/utils/app_colors.dart';
import 'features/auth/login/presentation/manager/login_cubit.dart';

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
          return Scaffold(
            body: Center(
              child: Image.asset(AppImages.splashImg),
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
      context.pushNamed(bottomNavBarPageRoute);
    }
  }
}
