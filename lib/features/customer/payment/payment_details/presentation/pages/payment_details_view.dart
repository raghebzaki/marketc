import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/database/address_class.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/arguments.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/shared/widgets/custom_form_field.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/app_constants.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/shared/cubits/cart_cubit/cart_cubit.dart';
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class PaymentDetailsView extends StatefulWidget {
  final Address? address;

  const PaymentDetailsView({super.key, required this.address});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  @override
  void initState() {
    super.initState();
    addressCtrl = TextEditingController(text: widget.address!.address!);
    phoneCtrl = TextEditingController(text: widget.address!.phone!);
  }

  bool switchOnOff = true;
  TextEditingController nameCtrl = TextEditingController(text: UserData.name);
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<ProductEntity> totalPrice = context.watch<CartCubit>().cartProducts;

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
                          ctrl: nameCtrl,
                          hint: S.of(context).buyer_full_name,
                        ),
                        Gap(15.h),
                        Text(
                          S.of(context).buyer_phone,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Gap(10.h),
                        CustomFormField(
                          isEnable: false,
                          ctrl: phoneCtrl,
                          // preIcon: CountryCodePicker(
                          //   initialSelection: 'SA',
                          //   favorite: const ['966', 'SA'],
                          //   onChanged: (code) {
                          //     // registerCubit.countryCode = code.dialCode!;
                          //   },
                          // ),
                          hint: S.of(context).buyer_phone,
                        ),
                        Gap(15.h),
                        Text(
                          S.of(context).buyer_address,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Gap(10.h),
                        CustomFormField(
                          isEnable: false,
                          ctrl: addressCtrl,
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
                              "${(totalPrice.map(
                                    (e) => e.discountPercent == 0
                                        ? int.parse(e.price!) *
                                                e.userQuantity! +
                                            int.parse(e.price!) *
                                                e.userQuantity! /
                                                10
                                        : int.parse(e.priceAfterDiscount!) *
                                                e.userQuantity! +
                                            int.parse(e.priceAfterDiscount!) *
                                                e.userQuantity! /
                                                10,
                                  ).reduce((value, element) => value + element) + AppConstants.deliveryFee)} ${S.current.sar}",
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
                              "${(totalPrice.map((e) => e.discountPercent == 0 ? int.parse(e.price!) * e.userQuantity! : int.parse(e.priceAfterDiscount!) * e.userQuantity!).reduce((value, element) => value + element))} ${S.current.sar}",
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
                              '${AppConstants.deliveryFee} ${S.current.sar}',
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
                              S.current.tax,
                              style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: AppColors.textColorSecondary),
                            ),
                            const Spacer(),
                            Text(
                              '${totalPrice.map((e) => e.discountPercent == 0 ? int.parse(e.price!) * e.userQuantity! : int.parse(e.priceAfterDiscount!) * e.userQuantity!).reduce((value, element) => value + element) / 10} ${S.current.sar}',
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
                    context.pushNamed(paymentGateWayPageRoute,
                        arguments: AddressArgs(
                          nameCtrl.text,
                          address: widget.address!,
                        ));
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
