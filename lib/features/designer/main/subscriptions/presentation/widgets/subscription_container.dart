import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:marketc/features/designer/main/subscriptions/presentation/widgets/benifets_item.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class SubscriptionContainer extends StatelessWidget {
  final String packageName;
  final String packagePrice;
  final List<String> packageBenefits;
  final String packageDiscountPrice;

  const SubscriptionContainer({
    super.key,
    required this.packageName,
    required this.packagePrice,
    required this.packageBenefits,
    required this.packageDiscountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 15.h,
              decoration: const ShapeDecoration(
                color: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.r8),
                    topLeft: Radius.circular(Dimensions.r8),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.p8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.r8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    packageName,
                    style: CustomTextStyle.kTextStyleF10.copyWith(
                      color: AppColors.black80,
                    ),
                  ),
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).instead,
                        style: CustomTextStyle.kTextStyleF8.copyWith(
                          color: AppColors.errorColor,
                        ),
                      ),
                      Gap(5.w),
                      Text(
                        "$packagePrice ${S.current.sar}",
                        style: CustomTextStyle.kTextStyleF8.copyWith(
                          color: AppColors.errorColor,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.errorColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(5.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.p5.h,
                    ),
                    color: AppColors.secondary,
                    child: Center(
                      child: Text(
                        S.of(context).yearly_sub,
                        style: CustomTextStyle.kTextStyleF10.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Gap(15.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: packageBenefits.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BenefitsItem(
                            benefit: packageBenefits[index],
                          ).paddingSymmetric(
                            vertical: Dimensions.p5.h,
                          ),
                        ],
                      );
                    },
                  ),
                  Gap(50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.p5.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.p8.h,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10)),
                      child: Center(
                        child: Text(
                          packageDiscountPrice,
                          style: CustomTextStyle.kTextStyleF10.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(35.h),
                ],
              ),
            ),
            Container(
              width: 100.w,
              height: 15.h,
              decoration: const ShapeDecoration(
                color: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(Dimensions.r8),
                    bottomLeft: Radius.circular(Dimensions.r8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
