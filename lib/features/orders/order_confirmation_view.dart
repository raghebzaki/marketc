import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/dimensions.dart';

import '../../core/utils/app_images.dart';
import '../../generated/l10n.dart';

class OrderConfirmationView extends StatelessWidget {
  const OrderConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaxGap(100.h),
              Center(
                child: Image.asset(
                  AppImages.orderConfirmationImg,
                  height: 280.h,
                  width: 280.w,
                ),
              ),
              Gap(15.h),
              Text(
                S.of(context).order_confirmed,
                style: CustomTextStyle.kTextStyleF20,
              ),
              Gap(25.h),
              Text(
                S.of(context).order_confirmed_msg,
                style: CustomTextStyle.kTextStyleF14,
                textAlign: TextAlign.center,
              ),
              MaxGap(65.h),
              CustomBtn(
                label: S.of(context).track_order_btn,
                onPressed: () {},
              ),
              Gap(25.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).continue_browsing,
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    color: AppColors.lightBlue,
                  ),
                ),
              ),
              Gap(25.h),
              Text(
                S.of(context).order_problem,
                style: CustomTextStyle.kTextStyleF14,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  S.current.cs,
                  style: CustomTextStyle.kTextStyleF14.copyWith(
                    color: AppColors.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
