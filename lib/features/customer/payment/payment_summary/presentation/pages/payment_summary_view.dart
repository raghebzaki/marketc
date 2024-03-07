import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/database/address_class.dart';
import 'package:marketc/core/shared/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketc/core/utils/app_constants.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/customer/payment/payment_summary/domain/entities/place_order_entity.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../payment_gate_way/domain/entities/promo_code_entity.dart';
import '../../../payment_gate_way/presentation/manager/promo_code_cubit.dart';
import '../manager/place_order_cubit.dart';

class PaymentSummaryView extends StatefulWidget {
  final Address address;
  final num? finalPrice;
  final String name;

  const PaymentSummaryView({super.key, required this.finalPrice, required this.address, required this.name,});

  @override
  State<PaymentSummaryView> createState() => _PaymentSummaryViewState();
}

class _PaymentSummaryViewState extends State<PaymentSummaryView> {

  bool isCoupon = false;
  num totalWithCoupon = 0;
  TextEditingController pinCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().cartProducts;
    double tax = widget.finalPrice!/10;
    return BlocProvider(
  create: (context) => di.di<PromoCodeCubit>(),
  child: Scaffold(
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
                                S.of(context).receiver_information,
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              // TextButton(
                              //   onPressed: () {},
                              //   child: Text(
                              //     S.of(context).edit,
                              //     style: CustomTextStyle.kTextStyleF14.copyWith(
                              //       color: AppColors.lightBlue,
                              //     ),
                              //   ),
                              // ),
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
                            widget.name,
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
                            widget.address.phone!,
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
                            widget.address.address!,
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    // Container(
                    //   padding: const EdgeInsets.all(Dimensions.p16),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(Dimensions.r10),
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             S.current.payment,
                    //             style: CustomTextStyle.kTextStyleF14,
                    //           ),
                    //
                    //         ],
                    //       ),
                    //       Gap(20.h),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               const Text("***** 6714"),
                    //               Gap(10.w),
                    //               Image.asset(
                    //                 AppImages.visaImg,
                    //                 height: 32.h,
                    //                 width: 32.w,
                    //                 fit: BoxFit.contain,
                    //               ),
                    //             ],
                    //           ),
                    //           Text(
                    //             "01/24",
                    //             style: CustomTextStyle.kTextStyleF12.copyWith(
                    //               color: AppColors.textColorSecondary,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    BlocConsumer<PromoCodeCubit, PromoCodeState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          promoSuccess: (state) {
                            if (state!.statusCode == true) {
                              isCoupon = true;

                              totalWithCoupon = widget.finalPrice! -
                                  widget.finalPrice! *
                                      num.parse(state.couponData!.discount
                                          .toString()) /
                                      100;
                              context.defaultSnackBar("Promo code applied successfully");
                            }
                          },
                          promoError: (errCode, err) {
                            context.defaultSnackBar("Coupon is expired");
                          },
                          orElse: () {
                            return null;
                          },
                        );
                      },
                      builder: (context, state) {
                        PromoCodeCubit promoCodeCubit =
                        PromoCodeCubit.get(context);
                        return TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  insetPadding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.p16,
                                      vertical: Dimensions.p32),
                                  title: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Gap(35.h),
                                      Text(
                                        S.of(context).add_promo_code,
                                        style: CustomTextStyle.kTextStyleF20,
                                      ),
                                      Text(
                                        S.of(context).add_promo_code_des,
                                        style: CustomTextStyle.kTextStyleF12
                                            .copyWith(
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
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp("[a-z A-Z á-ú Á-Ú 0-9]"),
                                          ),
                                        ],
                                        closeKeyboardWhenCompleted: false,
                                        onSubmitted: (value) {},
                                        keyboardType: TextInputType.text,
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
                                            borderRadius:
                                            BorderRadius.circular(
                                              Dimensions.r20,
                                            ),
                                          ),
                                          textStyle:
                                          CustomTextStyle.kPinTextStyle,
                                        ),
                                      ),
                                      Gap(35.h),
                                      ConditionalBuilder(
                                          condition: state is! PromoLoading,
                                          builder: (BuildContext ctx) {
                                            return CustomBtn(
                                              label: S.of(context).confirm,
                                              onPressed: () {
                                                promoCodeCubit.sendMessage(
                                                  PromoCodeEntity(
                                                    userId: UserData.id,
                                                    coupon: pinCtrl.text,
                                                  ),
                                                );
                                                context.pop();
                                              },
                                            );
                                          },
                                          fallback: (BuildContext ctx) {
                                            return const StateLoadingWidget();
                                          })
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
                        );
                      },
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
                          Text(
                            S.of(context).order_summary,
                            style: CustomTextStyle.kTextStyleF14,
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
                                "${widget.finalPrice! + tax + AppConstants.deliveryFee} ${S.current.sar}",
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
                                "${widget.finalPrice!} ${S.current.sar}",
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
                                '${tax.toStringAsFixed(2)} ${S.current.sar}',
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
            BlocProvider(
              create: (context) => di.di<PlaceOrderCubit>(),
              child: BlocConsumer<PlaceOrderCubit, PlaceOrderStates>(
                listener: (context, state) {
                  PlaceOrderCubit placeOrderCubit =
                  PlaceOrderCubit.get(context);
                  state.maybeWhen(
                    success: (state) {
                      placeOrderCubit.paymentLauncher(state.paymentUrl!);
                      context.defaultSnackBar("Order placed successfully, now redirecting to payment");
                        // context.pushNamed(orderConfirmationPageRoute);
                        cartItems.clear();
                    },
                    orElse: () {
                      return null;
                    },
                  );
                },
                builder: (context, state) {
                  PlaceOrderCubit placeOrderCubit =
                      PlaceOrderCubit.get(context);
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      child: CustomBtn(
                        label: S.of(context).confirm_payment,
                        onPressed: () async {
                          Map productId = {};

                          for (int i = 0; i < cartItems.length; i++) {
                            productId['${cartItems[i].id}'] = cartItems[i].userQuantity;
                          }

                          Map colorId = {};

                          for (int i = 0; i < cartItems.length; i++) {
                            colorId['${cartItems[i].id}'] = cartItems[i].sendColor![0];
                          }

                          Map sizeId = {};

                          for (int i = 0; i < cartItems.length; i++) {
                            sizeId['${cartItems[i].id}'] = cartItems[i].sendSize![0];
                          }



                          placeOrderCubit.placeOrder(
                            PlaceOrderEntity(
                              userId: UserData.id,
                              name: widget.name,
                              phone: widget.address.phone,
                              address: widget.address.address,
                              buildingNo: widget.address.building,
                              flatNo: widget.address.flat,
                              city: widget.address.city,
                              state: widget.address.country,
                              postCode: widget.address.code,
                              productIds: productId,
                              colorIds: colorId,
                              sizeIds: sizeId,
                              coupon: isCoupon ? pinCtrl.text : "",
                            ),
                          );

                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
);
  }
}
