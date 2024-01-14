import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/themes/app_text_styles.dart';
import '../../utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 130.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/160x130"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  'ملابس قصيرة',
                  style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.textColor),
                ),
                Text(
                  'تطريز شعارات',
                  style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.textColorSecondary),
                ), Text(
                  '178 عملية شراء',
                  style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.textColorSecondary),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '140.00 SAR',
                      style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.lightBlue),
                    ),
                    Gap( 8.w),
                    Text(
                      '-30%',
                      style: CustomTextStyle.kTextStyleF12.copyWith(color: AppColors.discountNumber),

                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 152.w,
            height: 32.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColors.secondary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Center(
              child: Text(
                'عرض التفاصيل',
                textAlign: TextAlign.center,
                style:CustomTextStyle.kTextStyleF12.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}