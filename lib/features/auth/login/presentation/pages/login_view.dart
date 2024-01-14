import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';

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
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.loginSvg,
                      height: 187.h,
                      width: 310.w,
                    ),
                    Gap(5.h),
                    Text(
                      S.current.login,
                      style: CustomTextStyle.kTextStyleF24,
                    ),
                  ],
                ),
                Gap(20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Gap(10.h),
                    Text(
                      S.current.pass,
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                    Gap(5.h),
                    CustomFormField(
                      preIcon: Image.asset(AppImages.lockImg),
                      label: S.current.pass,
                      isObscure: true,
                      sufIcon: Icon(MdiIcons.eye),
                    ),
                    Gap(15.h),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(forgotPassPageRoute);
                    },
                    child: Text(
                      S.current.forgot_pass,
                      style: CustomTextStyle.kTextStyleF16.copyWith(
                        color: AppColors.black60,
                      ),
                    ),
                  ),
                ),
                Gap(25.h),
                ConditionalBuilder(
                    condition: true,
                    builder: (BuildContext context) {
                      return CustomBtn(
                        label: S.current.login,
                        onPressed: () {
                          context.pushNamed(homePageRoute);

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
                    }),
                Gap(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.current.do_not_have_account,
                      style: CustomTextStyle.kTextStyleF16.copyWith(
                        color: AppColors.black60,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(registerPageRoute);
                      },
                      child: Text(
                        S.current.register_now,
                        style: CustomTextStyle.kTextStyleF16.copyWith(
                          color: AppColors.black80,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
