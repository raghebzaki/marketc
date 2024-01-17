import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/app_images.dart';
import 'package:marketc/core/utils/dimensions.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/l10n.dart';

class OrderDetailsView extends StatefulWidget {
  // final String? orderNo;
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: "${S.current.order_no} #254667"),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                Dimensions.p16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(25.h),
                  Text(
                    S.of(context).arriving_to,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                  Gap(10.h),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.p16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.mapPointerImg,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                  Gap(8.w),
                                  Text(
                                    "764,الفيصلية, جدة ,السعودية",
                                    style: CustomTextStyle.kTextStyleF12,
                                  ),
                                ],
                              ),
                              Gap(12.h),
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.personImg,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                  Gap(8.w),
                                  Text(
                                    "محمود شاهين",
                                    style: CustomTextStyle.kTextStyleF12,
                                  ),
                                ],
                              ),
                              Gap(12.h),
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.phoneImg,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                  Gap(8.w),
                                  Text(
                                    "+1 (454) 3421 1142",
                                    style: CustomTextStyle.kTextStyleF12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.r15),
                          child: Image.network(
                            "https://via.placeholder.com/124x104",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    S.of(context).executed_request,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                  Gap(15.h),
                  Container(
                    padding: const EdgeInsets.all(Dimensions.p8),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.r5),
                          child: Image.network(
                            "https://via.placeholder.com/80x80",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.p8),
                          child: Column(
                            children: [
                              const Text("ملابس الهودي"),
                              Text("87.00 ${S.current.sar}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(15.h),
                  Container(
                    padding: const EdgeInsets.all(Dimensions.p8),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.r5),
                          child: Image.network(
                            "https://via.placeholder.com/80x80",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.p8),
                          child: Column(
                            children: [
                              const Text("ملابس الهودي"),
                              Text("87.00 ${S.current.sar}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                width: context.queryWidth.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.p25,
                    ),
                    topRight: Radius.circular(
                      Dimensions.p25,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).track_order,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Text(
                          "#245667",
                          style: CustomTextStyle.kTextStyleF14
                        ),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).total,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Text(
                          "113.30 ${S.current.sar}",
                          style: CustomTextStyle.kTextStyleF14
                        ),
                      ],
                    ),
                    Gap(15.h),
                    const Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).subtotal,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textColorGrey,
                          ),
                        ),
                        Text(
                          "109.00 ${S.current.sar}",
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).delivery_fee,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textColorGrey,
                          ),
                        ),
                        Text("4.30 ${S.current.sar}",
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
