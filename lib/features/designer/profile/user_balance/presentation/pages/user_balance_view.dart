 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../generated/l10n.dart';

class UserBalanceView extends StatelessWidget {
  const UserBalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
        title: S.current.user_profile,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:  EdgeInsets.symmetric(vertical: 24.h),
                margin:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "${UserData.currentBalance}",
                      style:CustomTextStyle.kTextStyleF20.copyWith(color: AppColors.black80),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).can_send_money,
                      style:CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.textColorGrey),
                    ),
                    Gap(30.h),
                    SizedBox(
                      width: 280.w,
                      child: CustomBtn(
                        label: S.of(context).send_money,
                        onPressed: (){
                          context.pushNamed(designsPageRoute);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Text(
                  S.of(context).use_points,
                  style:CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                ),
              ),
              Gap(10.h),
              Container(
                width: double.infinity,
                margin:  EdgeInsets.symmetric(horizontal: 16.w),
                padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 10.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderColor),
                  ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).code,
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      S.of(context).amount,
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      S.of(context).date,
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),

                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin:  EdgeInsets.symmetric(horizontal: 16.w),
                padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 10.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderColor),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#245667',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      '2000',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      '03/12/2022',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),

                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin:  EdgeInsets.symmetric(horizontal: 16.w),
                padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 10.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderColor),
                  ),                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#778739',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      '4667',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      '03/05/2022',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),

                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin:  EdgeInsets.symmetric(horizontal: 16.w),
                padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 10.w),
                decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:  Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#223667',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      '6780',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),
                    ),
                    Text(
                      '03/06/2023',
                      style:CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorGrey),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
