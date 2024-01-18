import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/dimensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/l10n.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
        title: S.of(context).subscriptions,
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
                S.of(context).subscriptions_title,
                style: CustomTextStyle.kTextStyleF20,
              ),
              Gap(10.h),
              Text(
                S.of(context).subscriptions_des,
                style: CustomTextStyle.kTextStyleF14,
              ),
              Gap(60.h),
              Padding(
                padding: const EdgeInsets.all(Dimensions.p10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: Dimensions.p8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.r8)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.of(context).gold_pack,
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
                                        style:
                                            CustomTextStyle.kTextStyleF8.copyWith(
                                          color: AppColors.errorColor,
                                        ),
                                      ),
                                      Gap(5.w),
                                      Text(
                                        "1700 ${S.current.sar}",
                                        style:
                                            CustomTextStyle.kTextStyleF8.copyWith(
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
                                        style: CustomTextStyle.kTextStyleF10
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(15.h),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: AppColors.successColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                S.of(context).fifty_percent,
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: AppColors.successColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                S.of(context).thirty_design,
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
                                                // overflow: TextOverflow.visible,
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: AppColors.successColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                S.of(context).view_on_home,
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: AppColors.successColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                S.of(context).free_shipping,
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(50.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.p5.w),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.p8.h,
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors.secondary,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.r10)),
                                      child: Center(
                                        child: Text(
                                          S.of(context).yearly_sub_price,
                                          style: CustomTextStyle.kTextStyleF10
                                              .copyWith(
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
                    Gap(15.h),
                    Expanded(
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: Dimensions.p8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.r8)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.of(context).diamond_pack,
                                    style: CustomTextStyle.kTextStyleF10.copyWith(
                                      color: AppColors.black80,
                                    ),
                                  ),
                                  Gap(5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.current.instead,
                                        style:
                                        CustomTextStyle.kTextStyleF8.copyWith(
                                          color: AppColors.errorColor,
                                        ),
                                      ),
                                      Gap(5.w),
                                      Text(
                                        "899 ${S.current.sar}",
                                        style:
                                        CustomTextStyle.kTextStyleF8.copyWith(
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
                                        S.of(context).monthly_sub,
                                        style: CustomTextStyle.kTextStyleF10
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(15.h),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: AppColors.successColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                S.current.fifty_percent,
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: AppColors.successColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                S.of(context).ten_desings,
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: AppColors.successColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                S.current.view_on_home,
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              MdiIcons.checkCircle,
                                              color: Colors.transparent,
                                            ),
                                            Text(
                                              "",
                                              style:
                                              CustomTextStyle.kTextStyleF8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(50.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.p5.w),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.p8.h,
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors.secondary,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.r10)),
                                      child: Center(
                                        child: Text(
                                          S.of(context).monthly_sub_price,
                                          style: CustomTextStyle.kTextStyleF10
                                              .copyWith(
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
