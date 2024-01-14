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

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.current.register,
                  style: CustomTextStyle.kTextStyleF24,
                ),
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
                      S.current.full_name,
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                    Gap(5.h),
                    CustomFormField(
                      preIcon: Image.asset(AppImages.profileImg),
                      label: S.current.full_name,
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
                    Gap(15.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(Dimensions.p8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.secondary,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(
                                Dimensions.r8,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    S.current.buyer,
                                    style: CustomTextStyle.kTextStyleF16.copyWith(
                                      color: AppColors.black60,
                                    ),
                                  ),
                                ),
                                Gap(20.h),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SvgPicture.asset(
                                    AppImages.buyerSvg,
                                    height: 72.h,
                                    width: 70.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(10.w),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(Dimensions.p8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.secondary,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(
                                Dimensions.r8,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    S.current.seller,
                                    style: CustomTextStyle.kTextStyleF16.copyWith(
                                      color: AppColors.black60,
                                    ),
                                  ),
                                ),
                                Gap(20.h),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    AppImages.sellerImg,
                                    height: 72.h,
                                    width: 70.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(20.h),
                    ConditionalBuilder(
                        condition: true,
                        builder: (BuildContext context) {
                          return CustomBtn(
                            label: S.current.register,
                            onPressed: () {
                              context.pushNamed(verifyAccountPageRoute);
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
