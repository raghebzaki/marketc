import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/utils/app_colors.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../generated/l10n.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: CustomAppBar(
        title: S.current.contact_us,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20.h),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(
                 width: 100.w,
                 height: 100.w,
                 decoration:  BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(AppImages.appLogo),
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
               Column(
                 children: [
                   Text(
                     S.current.email,
                     style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.textColorSecondary),
                   ),
                   Gap(5.h),
                   Text(
                     'support@foryou.app',
                     style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorSecondary),
                   ),
                   Gap(10.h),
                   Text(
                     S.current.phone,
                     style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.textColorSecondary),
                   ),
                   Gap(5.h),
                   Text(
                     '+966 59 333 4444',
                     style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorSecondary),
                   ),
                   Gap(10.h),
                   Text(
                     S.current.address,
                     style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.textColorSecondary),
                   ),
                   Gap(5.h),
                   Text(
                     '477,الفيصلية ,المملكة العربية السعودية',
                     style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorSecondary),
                   ),
                   Gap(10.h),

                 ],
               )
             ],
           ),
            Gap(20.h),
            Text(
              S.current.message,
              style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
            ),
            CustomBtn(
              label: S.current.send,
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
