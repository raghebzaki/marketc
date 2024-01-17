import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/router/router.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/shared/widgets/status_indicator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../generated/l10n.dart';

class OrderContainer extends StatelessWidget {
  final String? orderNo;
  final String? total;
  final String? qty;
  final DateTime? date;

  const OrderContainer({
    super.key,
    this.orderNo,
    this.total,
    this.qty,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(orderDetailsPageRoute);
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
                  "${S.of(context).track_order} #$orderNo",
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
                      "$total ${S.current.sar}",
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
                      qty!,
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                  ],
                ),
              ],
            ),
            Gap(20.h),
            Text(
              date!.stringFormat(DateFormatType.shortDate),
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
