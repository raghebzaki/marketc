import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/shared/widgets/custom_form_field.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/customer/profile/edit_profile/presentation/manager/edit_profile_cubit.dart';

import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../generated/l10n.dart';
import '../../domain/entities/edit_profile_entity.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<EditProfileCubit>(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              context.defaultSnackBar(S.of(context).deleted_success);
              context.pushNamed(loginPageRoute);
            },
            orElse: () {
              return null;
            },
          );
        },
        builder: (context, state) {
          EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.current.user_profile,
            ),
            backgroundColor: AppColors.primary,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/73x73"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Gap(20.h),
                    Text(
                      S.current.full_name,
                      style: CustomTextStyle.kTextStyleF14
                          .copyWith(color: AppColors.textColor),
                    ),
                    Gap(5.h),
                    CustomFormField(
                      hint: UserData.name,
                      ctrl: nameCtrl,
                    ),
                    Gap(10.h),
                    Text(
                      S.current.email,
                      style: CustomTextStyle.kTextStyleF14
                          .copyWith(color: AppColors.textColor),
                    ),
                    Gap(5.h),
                    CustomFormField(
                      hint: 'ahmedd1203@gmail.com',
                      ctrl: email,
                    ),
                    Gap(10.h),
                    Text(
                      S.current.pass,
                      style: CustomTextStyle.kTextStyleF14
                          .copyWith(color: AppColors.textColor),
                    ),
                    Gap(5.h),
                    CustomFormField(
                      hint: '**** **** ****',
                      ctrl: password,
                      isObscure: true,
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        Icon(
                          Icons.delete_outlined,
                          color: Colors.red[300],
                          size: 24.sp,
                        ),
                        Gap(10.w),
                        TextButton(
                          onPressed: () {
                            editProfileCubit.deleteAccount(
                              EditProfileEntity(
                                userId: UserData.id,
                              ),
                            );
                          },
                          child: Text(
                            S.of(context).delete_account,
                            style: CustomTextStyle.kTextStyleF14
                                .copyWith(color: Colors.red[300]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
