import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/auth/change_pass/domain/entities/change_pass_entity.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pinput/pinput.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../manager/change_pass_cubit.dart';

class ChangePassView extends StatefulWidget {
  final String email;

  const ChangePassView({super.key, required this.email});

  @override
  State<ChangePassView> createState() => _ChangePassViewState();
}

class _ChangePassViewState extends State<ChangePassView> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool password = true;
  bool passwordConfirmation = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<ChangePassCubit>(),
      child: BlocConsumer<ChangePassCubit, ChangePassStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              if (state.status == 1) {
                context.defaultSnackBar("Password Changed Successfully");
                context.pushNamed(changePassConfirmationPageRoute);
              } else {
                context.defaultSnackBar("Failed to change password");
              }
            },
            error: (errCode, err) {
              context.defaultSnackBar("Error Code: $errCode, $err");
            },
            orElse: () {
              return null;
            },
          );
        },
        builder: (context, state) {
          ChangePassCubit changePassCubit = ChangePassCubit.get(context);
          return Scaffold(
            body: Form(
              key: formKey,
              child: SafeArea(
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
                          ctrl: changePassCubit.passCtrl,
                          preIcon: Image.asset(AppImages.lockImg),
                          label: S.current.pass,
                          isObscure: password,
                          sufIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            child: password
                                ? Icon(MdiIcons.eye)
                                : Icon(MdiIcons.eyeOff),
                          ),
                          validator: (value) {
                            if (changePassCubit.passCtrl.text.isEmpty) {
                              return "Password must be entered";
                            } else if (changePassCubit.passCtrl.length < 8) {
                              return "Password must be 8 chars at least";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Gap(10.h),
                        Text(
                          S.current.pass_confirm,
                          style: CustomTextStyle.kTextStyleF12,
                        ),
                        Gap(5.h),
                        CustomFormField(
                          ctrl: changePassCubit.passConfirmCtrl,
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
                          validator: (value) {
                            if (changePassCubit.passConfirmCtrl.text.isEmpty) {
                              return "Password confirmation can't be empty";
                            } else if (changePassCubit.passConfirmCtrl.text !=
                                changePassCubit.passCtrl.text) {
                              return "Passwords doesn't match";
                            } else {
                              return null;
                            }
                          },
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
                          condition: state is Loading,
                          builder: (BuildContext context) {
                            return CustomBtn(
                              label: S.current.change_pass,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  changePassCubit.userChangePass(
                                    ChangePassEntity(
                                      email: widget.email,
                                      pass: changePassCubit.passCtrl.text,
                                      confirmPass:
                                          changePassCubit.passConfirmCtrl.text,
                                    ),
                                  );
                                }
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
            ),
          );
        },
      ),
    );
  }
}
