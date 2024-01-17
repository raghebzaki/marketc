import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/shared/widgets/custom_form_field.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/app_images.dart';
import 'package:marketc/core/utils/dimensions.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';

class PaymentGateWayView extends StatefulWidget {
  const PaymentGateWayView({super.key});

  @override
  State<PaymentGateWayView> createState() => _PaymentGateWayViewState();
}

class _PaymentGateWayViewState extends State<PaymentGateWayView> {
  bool isChecked = true;
  bool groupValue = false;

  List<String> payments = [
    "مدى",
    "تمارا",
    "tabby",
    "mastercard",
    "visa",
  ];

  List<String> paymentImgs = [
    AppImages.madaPaymentImg,
    AppImages.tamaraPaymentImg,
    AppImages.tabbyPaymentImg,
    AppImages.mastercardImg,
    AppImages.visaImg,
  ];

  String currentPayment = "mada";

  TextEditingController pinCtrl = TextEditingController();

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
                      S.current.payment,
                      style: CustomTextStyle.kTextStyleF20,
                    ),
                    Gap(10.h),
                    Text(
                      S.of(context).payment_alert,
                      style: CustomTextStyle.kTextStyleF14.copyWith(
                        color: AppColors.textColorSecondary,
                      ),
                    ),
                    Gap(15.h),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              insetPadding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16,
                                  vertical: Dimensions.p32),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Gap(35.h),
                                  Text(
                                    S.of(context).add_promo_code,
                                    style: CustomTextStyle.kTextStyleF20,
                                  ),
                                  Text(
                                    S.of(context).add_promo_code_des,
                                    style:
                                        CustomTextStyle.kTextStyleF12.copyWith(
                                      color: AppColors.black60,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Gap(35.h),
                                  Pinput(
                                    controller: pinCtrl,
                                    onChanged: (value) {
                                      // UserData.otp = value;
                                    },
                                    closeKeyboardWhenCompleted: false,
                                    onSubmitted: (value) {},
                                    length: 4,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    focusNode: FocusNode(),
                                    showCursor: true,
                                    defaultPinTheme: PinTheme(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColors.primary,
                                        border: Border.all(
                                          color: AppColors.secondary,
                                          width: 1,
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.r20,
                                        ),
                                      ),
                                      textStyle: CustomTextStyle.kPinTextStyle,
                                    ),
                                  ),
                                  Gap(35.h),
                                  CustomBtn(
                                    label: S.of(context).confirm,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        S.current.add_promo_code,
                        style: CustomTextStyle.kTextStyleF14.copyWith(
                          color: AppColors.lightBlue,
                        ),
                      ),
                    ),
                    Gap(15.h),
                    Text(
                      S.of(context).choose_payment_way,
                      style: CustomTextStyle.kTextStyleF16,
                    ),
                    Gap(15.h),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: payments.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimensions.p8),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  paymentImgs[index],
                                  height: 32.h,
                                  width: 32.h,
                                  fit: BoxFit.contain,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      payments[index],
                                      style: CustomTextStyle.kTextStyleF14,
                                    ),
                                    Radio(
                                      activeColor: AppColors.secondary,
                                      value: payments[index],
                                      groupValue: currentPayment,
                                      onChanged: (value) {
                                        setState(() {
                                          currentPayment =
                                              value.isNullOrEmpty();
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Gap(15.h),
                    Column(
                      children: [
                        CustomFormField(
                          hint: S.of(context).card_holder_name,
                        ),
                        CustomFormField(
                          hint: S.of(context).card_no,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: CustomFormField(
                                hint: S.of(context).vcc,
                              ),
                            ),
                            Gap(5.w),
                            Flexible(
                              child: CustomFormField(
                                hint: S.of(context).card_date,
                              ),
                            ),
                          ],
                        )
                      ],
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
                  label: S.current.progress,
                  onPressed: () {
                    context.pushNamed(paymentSummaryPageRoute);
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
