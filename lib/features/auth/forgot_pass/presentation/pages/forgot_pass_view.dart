import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/utils/app_images.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({super.key});

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.forgotPassImg,
                        height: 180.h,
                        width: 180.w,
                      ),
                    ),
                    Gap(40.h),
                    Text(
                      S.current.forgot_pass,
                      style: CustomTextStyle.kTextStyleF20.copyWith(
                        color: AppColors.black80,
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      S.current.enter_email,
                      style: CustomTextStyle.kTextStyleF12.copyWith(
                        color: AppColors.black60,
                      ),
                    ),
                    Gap(60.h),
                    Text(
                      S.current.email,
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                    Gap(5.h),
                    CustomFormField(
                      preIcon: Image.asset(AppImages.emailImg),
                      label: S.current.email,
                      isObscure: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          S.current.remember_pass,
                          style: CustomTextStyle.kTextStyleF16.copyWith(
                            color: AppColors.black60,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(loginPageRoute);
                          },
                          child: Text(
                            S.current.login_now,
                            style: CustomTextStyle.kTextStyleF16.copyWith(
                              color: AppColors.black80,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                ConditionalBuilder(
                  condition: true,
                  builder: (BuildContext context) {
                    return CustomBtn(
                      label: S.current.send_code,
                      onPressed: () {
                        context.pushNamed(resetPassPageRoute);
                      },
                      fgColor: Colors.white,
                      isUpperCase: true,
                    );
                  },
                  fallback: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.secondary,
                      ),
                    );
                  },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
