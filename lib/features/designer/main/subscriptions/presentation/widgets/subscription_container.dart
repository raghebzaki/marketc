import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/helpers/cache_helper.dart';
import 'package:marketc/features/designer/main/subscriptions/domain/entity/subscription_entity.dart';
import 'package:marketc/features/designer/main/subscriptions/presentation/widgets/benifets_item.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class SubscriptionContainer extends StatelessWidget {
  final PackageDataEntity packageDataEntity;
  final VoidCallback onTap;

  const SubscriptionContainer({
    super.key,
    required this.packageDataEntity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      CacheHelper.isEnglish() ? packageDataEntity.packageNameEn! : packageDataEntity.packageNameAr!,
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
                          "${packageDataEntity.price} ${S.current.sar}",
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
                    packageDataEntity.feature1!.isEmpty ? const SizedBox.shrink() : BenefitsItem(benefit: packageDataEntity.feature1!),
                    packageDataEntity.feature2!.isEmpty ? const SizedBox.shrink() : BenefitsItem(benefit: packageDataEntity.feature2!),
                    packageDataEntity.feature3!.isEmpty ? const SizedBox.shrink() : BenefitsItem(benefit: packageDataEntity.feature3!),
                    packageDataEntity.feature4!.isEmpty ? const SizedBox.shrink() : BenefitsItem(benefit: packageDataEntity.feature4!),
                    packageDataEntity.feature5!.isEmpty ? const SizedBox.shrink() : BenefitsItem(benefit: packageDataEntity.feature5!),
                    packageDataEntity.feature6!.isEmpty ? const SizedBox.shrink() : BenefitsItem(benefit: packageDataEntity.feature6!),
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
                            packageDataEntity.price.toString(),
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
      ),
    );
  }
}
