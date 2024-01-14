import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/core/utils/extensions.dart';

import 'config/themes/app_text_styles.dart';
import 'core/shared/cubits/internet_checker_cubit.dart';
import 'core/utils/app_colors.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: BlocConsumer<InternetCubit, InternetStates>(
        listener: (context, state) {
          if (state == InternetStates.gained) {
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
              child: Text(
                "This is main view",
                style: CustomTextStyle.kTextStyleF32,
              ),
            ),
          );
        },
      ),
    );
  }

  // rememberMe(String email, String pass) async {
  //   String email = await CacheHelper.getData("email");
  //   String pass = await CacheHelper.getData("pass");
  //
  //
  // }

}
