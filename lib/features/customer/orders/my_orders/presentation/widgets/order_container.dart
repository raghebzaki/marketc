import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/entities/order_entity.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/shared/arguments.dart';
import '../../../../../../core/shared/widgets/status_indicator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../generated/l10n.dart';

class OrderContainer extends StatelessWidget {
  final OrderEntity? orderEntity;

  const OrderContainer({
    super.key,
    this.orderEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          orderDetailsPageRoute,
          arguments: OrderDetailsArgs(
            orderDetails: orderEntity!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.p20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${S.of(context).track_order} #${orderEntity!.orderNumber}",
                  style: CustomTextStyle.kTextStyleF14,
                ),
                const StatusIndicator(
                  statusText: "قيد التنقيذ",
                  textColor: AppColors.statusGreen,
                  containerColor: AppColors.statusGreenContainer,
                )
              ],
            ),
            Gap(10.h),
            const Divider(thickness: 2.0),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${S.of(context).total}: ",
                      style: CustomTextStyle.kTextStyleF12.copyWith(
                        color: AppColors.textColorGrey,
                      ),
                    ),
                    Text(
                      "${orderEntity!.totalPrice} ${S.current.sar}",
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${S.of(context).qty}: ",
                      style: CustomTextStyle.kTextStyleF12.copyWith(
                        color: AppColors.textColorGrey,
                      ),
                    ),
                    Text(
                      orderEntity!.products!.length.toString(),
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                  ],
                ),
              ],
            ),
            Gap(20.h),
            Text(
              DateTime.parse(
                orderEntity!.date!,
              ).stringFormat(
                DateFormatType.hyphenatedDate,
              ),
              style: CustomTextStyle.kTextStyleF12.copyWith(
                color: AppColors.textColorGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
