import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/widgets/custom_form_field.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/dimensions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppImages.loginSvg,
                height: 187.h,
                width: 310.w,
              ),
              Gap(5.h),
              const Text("Login"),
              Gap(20.h),
              const Text("Email"),
              CustomFormField(
                preIcon: Image.asset(AppImages.emailImg),
                label: "Email",
                isObscure: false,
              ),
              Gap(10.h),
              const Text("Password"),
              CustomFormField(
                preIcon: Image.asset(AppImages.lockImg),
                label: "Password",
                isObscure: false,
              ),
              Gap(15.h),
              const Text("Forgot Pass?"),
            ],
          ),
        ),
      ),
    );
  }
}
