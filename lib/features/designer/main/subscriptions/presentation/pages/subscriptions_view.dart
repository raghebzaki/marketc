import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/dimensions.dart';

import '../../../../../../core/utils/app_colors.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const CustomAppBar(
        title: "الاشتراكات",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30.h),
              Text(
                "مرحبا بك في الاشتراكات",
                style: CustomTextStyle.kTextStyleF20,
              ),
              Gap(10.h),
              Text(
                "دعنا نساعدك في العثور على باقة الاشتراك المناسبة لديك بباقات متنوعة توفر لك الارباح والمميزات العديدة ",
                style: CustomTextStyle.kTextStyleF14,
              ),
              Gap(60.h),
              Padding(
                padding: const EdgeInsets.all(Dimensions.p10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 70.w,
                          height: 200.h,
                          decoration: ShapeDecoration(
                            color: AppColors.secondary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 15.h,
                          right: 0,
                          bottom: 15.h,
                          child: Container(
                            color: Colors.white,
                            width: 50,
                            height: 50,
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 70.w,
                          height: 200.h,
                          decoration: ShapeDecoration(
                            color: AppColors.secondary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 15.h,
                          right: 0,
                          bottom: 15.h,
                          child: Container(
                            color: Colors.white,
                            width: 100,
                            height: 50,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
