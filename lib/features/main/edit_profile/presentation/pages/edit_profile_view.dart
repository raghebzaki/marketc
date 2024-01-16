import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/shared/widgets/custom_form_field.dart';
import 'package:marketc/core/utils/app_colors.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController nameCtrl=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المعلومات الشخصية',
      ),
      backgroundColor: AppColors.primary,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 10.h),
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
                      image: NetworkImage("https://via.placeholder.com/73x73"),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Gap(20.h),
              Text(
                'الاسم كامل',
                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor),
              ),
              Gap(5.h),
              CustomFormField(
                hint: 'محمود شاهين',
                ctrl: nameCtrl,
          
              ),
              Gap(10.h),
            Text(
                'البريد الالكتروني',
                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor),
              ),
              Gap(5.h),
              CustomFormField(
                hint: 'ahmedd1203@gmail.com',
                ctrl: email,
          
              ),
              Gap(10.h),
            Text(
                'كلمة المرور',
                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor),
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
                  Icon(Icons.delete_outlined,color: Colors.red[300],size: 24.sp,),
                  Gap(10.w),
                  Text(
                    'حذف الحساب',
                    style: CustomTextStyle.kTextStyleF14.copyWith(color:Colors.red[300]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
