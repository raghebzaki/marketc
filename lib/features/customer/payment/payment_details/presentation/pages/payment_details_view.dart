import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/shared/widgets/custom_form_field.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  bool switchOnOff = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: S.of(context).payment),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Gap(25.h),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.of(context).ask_about_address,
                                style: CustomTextStyle.kTextStyleF16,
                              ),
                              Gap(5.h),
                              Text(
                                S.of(context).ask_about_address_des,
                                style: CustomTextStyle.kTextStyleF12.copyWith(
                                  color: AppColors.textColorSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: switchOnOff,
                          onChanged: (value) {
                            setState(
                              () {
                                switchOnOff = !switchOnOff;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(10.h),
                  Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.p16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).wrap_gift,
                                  style: CustomTextStyle.kTextStyleF14,
                                ),
                                Text(
                                  S.of(context).add_wrapping,
                                  style: CustomTextStyle.kTextStyleF12
                                      .copyWith(color: AppColors.textColorGrey),
                                ),
                                Text(
                                  "50.00 ${S.current.sar}",
                                  style: CustomTextStyle.kTextStyleF14.copyWith(
                                    color: AppColors.textColorSecondary,
                                  ),
                                ),
                              ],
                            ),
                            GFCheckbox(
                              size: GFSize.MEDIUM,
                              activeBgColor: AppColors.secondary,
                              type: GFCheckboxType.circle,
                              onChanged: (value) {
                                setState(() {
                                  switchOnOff = value;
                                });
                              },
                              value: switchOnOff,
                              inactiveIcon: null,
                            ),
                          ],
                        ),
                        Gap(20.h),
                        Text(
                          S.of(context).buyer_name,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Gap(10.h),
                        CustomFormField(
                          hint: S.of(context).buyer_full_name,
                        ),
                        Gap(15.h),
                        Text(
                          S.of(context).buyer_phone,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Gap(10.h),
                        CustomFormField(
                          preIcon: CountryCodePicker(
                            initialSelection: 'SA',
                            favorite: const ['966', 'SA'],
                            onChanged: (code) {
                              // registerCubit.countryCode = code.dialCode!;
                            },
                          ),
                          hint: S.of(context).buyer_phone,
                        ),
                        Gap(15.h),
                        Text(
                          S.of(context).buyer_address,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Gap(10.h),
                        CustomFormField(
                          hint: S.of(context).buyer_full_address,
                        ),
                        Gap(15.h),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(savedAddressesPageRoute);
                          },
                          child: Text(
                            S.of(context).choose_address,
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: AppColors.lightBlue,
                            ),
                          ),
                        ),
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
                        Gap(100.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: CustomBtn(
                  label: S.of(context).progress,
                  onPressed: () {
                    context.pushNamed(savedAddressesPageRoute);
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
