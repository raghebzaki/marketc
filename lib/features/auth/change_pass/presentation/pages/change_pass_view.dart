import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';

class ChangePassView extends StatefulWidget {
  const ChangePassView({super.key});

  @override
  State<ChangePassView> createState() => _ChangePassViewState();
}

class _ChangePassViewState extends State<ChangePassView> {
  bool password = true;
  bool passwordConfirmation = true;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(90.h),
                Text(
                  S.current.change_your_pass,
                  style: CustomTextStyle.kTextStyleF20.copyWith(
                    color: AppColors.black80,
                  ),
                ),
                Text(
                  S.current.enter_pass_below,
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    color: AppColors.black60,
                  ),
                ),
                Gap(55.h),
                Text(
                  S.current.pass,
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Gap(5.h),
                CustomFormField(
                  preIcon: Image.asset(AppImages.lockImg),
                  label: S.current.pass,
                  isObscure: password,
                  sufIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        password = !password;
                      });
                    },
                    child:
                        password ? Icon(MdiIcons.eye) : Icon(MdiIcons.eyeOff),
                  ),
                ),
                Gap(10.h),
                Text(
                  S.current.pass_confirm,
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Gap(5.h),
                CustomFormField(
                  preIcon: Image.asset(AppImages.lockImg),
                  label: S.current.pass_confirm,
                  isObscure: passwordConfirmation,
                  sufIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordConfirmation = !passwordConfirmation;
                      });
                    },
                    child: passwordConfirmation
                        ? Icon(MdiIcons.eye)
                        : Icon(MdiIcons.eyeOff),
                  ),
                ),
                Gap(20.h),
                Center(
                  child: Image.asset(
                    AppImages.changePassImg,
                    height: 250.h,
                    width: 250.w,
                  ),
                ),
                Gap(15.h),
                ConditionalBuilder(
                  condition: true,
                  builder: (BuildContext context) {
                    return CustomBtn(
                      label: S.current.change_pass,
                      onPressed: () {
                        context.pushNamed(changePassConfirmationPageRoute);
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
