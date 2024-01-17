import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class PaymentSummaryView extends StatefulWidget {
  const PaymentSummaryView({super.key});

  @override
  State<PaymentSummaryView> createState() => _PaymentSummaryViewState();
}

class _PaymentSummaryViewState extends State<PaymentSummaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: S.current.payment),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).confirm_order,
                      style: CustomTextStyle.kTextStyleF20,
                    ),
                    Gap(10.h),
                    Text(
                      S.of(context).confirm_order_msg,
                      style: CustomTextStyle.kTextStyleF14.copyWith(
                        color: AppColors.textColorSecondary,
                      ),
                    ),
                    Gap(15.h),
                    Container(
                      padding: const EdgeInsets.all(Dimensions.p16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.r10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "معلومات المستلم",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "تعديل",
                                  style: CustomTextStyle.kTextStyleF14.copyWith(
                                    color: AppColors.lightBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(10.h),
                          Text(
                            S.of(context).name,
                            style: CustomTextStyle.kTextStyleF12.copyWith(
                              color: AppColors.textColorGrey,
                            ),
                          ),
                          Gap(5.h),
                          Text(
                            "زهراء الفاطمية",
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(10.h),
                          Text(
                            S.of(context).phone_no,
                            style: CustomTextStyle.kTextStyleF12.copyWith(
                              color: AppColors.textColorGrey,
                            ),
                          ),
                          Gap(5.h),
                          Text(
                            "+966 54 335 9611",
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(10.h),
                          Text(
                            S.of(context).address,
                            style: CustomTextStyle.kTextStyleF12.copyWith(
                              color: AppColors.textColorGrey,
                            ),
                          ),
                          Gap(5.h),
                          Text(
                            "جدة, الفيصلية, الممكلة العربية السعودية",
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      padding: const EdgeInsets.all(Dimensions.p16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.r10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.current.payment,
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  S.of(context).edit,
                                  style: CustomTextStyle.kTextStyleF14.copyWith(
                                    color: AppColors.lightBlue,
                                  ),
                                ),
                              ),


                            ],
                          ),
                          Gap(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text("***** 6714"),
                                  Gap(10.w),
                                  Image.asset(
                                    AppImages.visaImg,
                                    height: 32.h,
                                    width: 32.w,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                              Text(
                                "01/24",
                                style:
                                CustomTextStyle.kTextStyleF12.copyWith(
                                  color: AppColors.textColorSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      padding: const EdgeInsets.all(Dimensions.p16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.r10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).order_summary, style: CustomTextStyle.kTextStyleF14,),
                          Gap(15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.current.order_no,
                                style: CustomTextStyle.kTextStyleF14
                                    .copyWith(color: AppColors.textColor),
                              ),
                              const Spacer(),
                              Text(
                                '#234465',
                                style: CustomTextStyle.kTextStyleF14
                                    .copyWith(color: AppColors.textColor),
                              ),
                            ],
                          ),
                          Gap(15.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.current.total,
                                style: CustomTextStyle.kTextStyleF14
                                    .copyWith(color: AppColors.textColor),
                              ),
                              const Spacer(),
                              Text(
                                '113.30 ${S.current.sar}',
                                style: CustomTextStyle.kTextStyleF14
                                    .copyWith(color: AppColors.textColor),
                              ),
                            ],
                          ),
                          Gap(15.h),
                          Container(
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0x14010C0E),
                                ),
                              ),
                            ),
                          ),
                          Gap(15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.current.subtotal,
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                    color: AppColors.textColorSecondary),
                              ),
                              const Spacer(),
                              Text(
                                '109.00 ${S.current.sar}',
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                    color: AppColors.textColorSecondary),
                              ),
                            ],
                          ),
                          Gap(15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.current.delivery_fee,
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                    color: AppColors.textColorSecondary),
                              ),
                              const Spacer(),
                              Text(
                                '4.30 ${S.current.sar}',
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                    color: AppColors.textColorSecondary),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Gap(100.h),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: CustomBtn(
                  label: "تأكيد الدفع",
                  onPressed: () {
                    context.pushNamed(orderConfirmationPageRoute);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
