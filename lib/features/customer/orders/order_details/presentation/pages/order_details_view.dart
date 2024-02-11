import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/app_constants.dart';
import 'package:marketc/core/utils/app_images.dart';
import 'package:marketc/core/utils/dimensions.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/shared/arguments.dart';
import '../../../../../../core/shared/entities/order_entity.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/l10n.dart';

class OrderDetailsView extends StatefulWidget {
  final OrderEntity orderDetails;

  // final String? orderNo;
  const OrderDetailsView({super.key, required this.orderDetails});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
          title: "${S.current.order_no} #${widget.orderDetails.orderNumber}"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).arriving_to,
                        style: CustomTextStyle.kTextStyleF16,
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(
                            trackOrderPageRoute,
                            arguments: OrderDetailsArgs(
                              orderDetails: widget.orderDetails,
                            ),
                          );
                        },
                        child: Text(
                          S.of(context).trackOrder,
                          style: CustomTextStyle.kTextStyleF16.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.p16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.orderDetails.address == null ? const SizedBox.shrink() :
                          Row(
                            children: [
                              Image.asset(
                                AppImages.mapPointerImg,
                                height: 16.h,
                                width: 16.w,
                              ),
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  "${widget.orderDetails.buildingNo}, ${widget.orderDetails.address}, ${widget.orderDetails.zipCode}, ${widget.orderDetails.city}, ${widget.orderDetails.state}",
                                  style: CustomTextStyle.kTextStyleF12,
                                  // overflow: TextOverflow.ellipsis,
                                ),
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
                                "${widget.orderDetails.userName}",
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
                                "${widget.orderDetails.phone}",
                                style: CustomTextStyle.kTextStyleF12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    S.of(context).executed_request,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                  Gap(15.h),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.orderDetails.products!.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          height: 80.h,
                          width: 80.w,
                          padding: const EdgeInsets.all(Dimensions.p8),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.r5),
                                child: Image.network(
                                  "${AppConstants.imageUrl}${widget.orderDetails.products![index].image}",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(Dimensions.p8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Intl.getCurrentLocale() == "en"
                                        ? Text(
                                            "${widget.orderDetails.products![index].nameEn}")
                                        : Text(
                                            "${widget.orderDetails.products![index].nameAr}"),
                                    Text(
                                        widget.orderDetails.products![index].discountPercent==0?
                                        "${widget.orderDetails.products![index].price} ${S.current.sar}":"${widget.orderDetails.products![index].priceAfterDiscount} ${S.current.sar}"),
                                    Text("${S.current.qty}: ${widget.orderDetails.products![index].pivot!.quantity}")
                                  ],
                                ),
                              ),

                            ],
                          ),
                        );
                      })
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
                        Text("#${widget.orderDetails.orderNumber}",
                            style: CustomTextStyle.kTextStyleF14),
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
                            "${widget.orderDetails.totalPrice} ${S.current.sar}",
                            style: CustomTextStyle.kTextStyleF14),
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
                          "${widget.orderDetails.price} ${S.current.sar}",
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
                        Text("40 ${S.current.sar}",
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).tax,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textColorGrey,
                          ),
                        ),
                        Text("${widget.orderDetails.tax} ${S.current.sar}",
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
