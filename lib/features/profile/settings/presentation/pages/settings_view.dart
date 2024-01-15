import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/helpers/cache_helper.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: S.current.settings,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20.h),
            Container(
              color: Colors.white,
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (BuildContext context) {
                        return Container(
                          padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 48.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.current.change_language,
                                textAlign: TextAlign.right,
                                style:CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary)
                              ),
                              Gap(30.h),
                              GestureDetector(
                                onTap: (){
                                  CacheHelper.setAppLanguage('en');
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'English - EN',
                                        style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.lightBlue)
                                    ),
                                    const Spacer(),
                                    Icon(Icons.check,size: 16.sp,color: AppColors.lightBlue,)
                                  ],
                                ),
                              ) ,
                              Gap(20.h),
                              GestureDetector(
                                onTap: (){
                                  CacheHelper.setAppLanguage('ar');
                                },
                                child: Row(
                                  children: [
                                    Text(
                                        'العربية - AR',
                                        style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorSecondary)
                                    ),
                                    const Spacer(),
                                    // Icon(Icons.check,size: 16.sp,color: AppColors.lightBlue,)
                                  ],
                                ),
                              ) ,

                            ],
                          ),
                        );
                      });
                },
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.language,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.lightBlue,size: 16.sp,),
              ),
            ),
            Gap(10.h),
            Container(
              color: Colors.white,
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: (){
                  context.pushNamed(notificationsPageRoute);
                },
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.notifications,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.lightBlue,size: 16.sp,),
              ),
            ),
            Gap(10.h),
            Container(
              color: Colors.white,
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.terms_and_conditions,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                trailing: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.lightBlue,size: 16.sp,),
              ),
            ),
            Gap(10.h),
            Container(
              color: Colors.white,
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: (){
                  context.pushNamed(contactUsPageRoute);
                },
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.contact_us,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                 trailing: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.lightBlue,size: 16.sp,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
