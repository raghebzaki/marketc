import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/database/database_hive.dart';
import 'package:marketc/core/shared/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/customer/payment/payment_summary/domain/entities/place_order_entity.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/place_order_cubit.dart';

class PaymentSummaryView extends StatefulWidget {
  const PaymentSummaryView({super.key});

  @override
  State<PaymentSummaryView> createState() => _PaymentSummaryViewState();
}

class _PaymentSummaryViewState extends State<PaymentSummaryView> {
  @override
  Widget build(BuildContext context) {
    var cartItems = context.watch<CartCubit>().cartProducts;
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
                                S.of(context).receiver_information,
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
                                style: CustomTextStyle.kTextStyleF12.copyWith(
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
                          Text(
                            S.of(context).order_summary,
                            style: CustomTextStyle.kTextStyleF14,
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
                  state.maybeWhen(
                    success: (state) {
                      if (state.status == 200) {
                        context.pushNamed(orderConfirmationPageRoute);
                      }
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
                            productId['${cartItems[i].id}'] =
                                cartItems[i].quantity;
                          }
                          print(productId);

                          HiveDatabase hiveDatabase = HiveDatabase();
                          var address = await hiveDatabase.addressBox;

                          placeOrderCubit.placeOrder(
                            PlaceOrderEntity(
                              userId: UserData.id,
                              name: UserData.name,
                              phone: UserData.phone,
                              address: address.getAt(0)!.address,
                              buildingNo: address.getAt(0)!.building,
                              flatNo: address.getAt(0)!.flat,
                              city: address.getAt(0)!.city,
                              state: address.getAt(0)!.country,
                              postCode: address.getAt(0)!.code,
                              productIds: productId,
                              coupon: "",
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
    );
  }
}
