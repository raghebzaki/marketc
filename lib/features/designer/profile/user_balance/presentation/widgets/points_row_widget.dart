import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../domain/entities/user_balance_entity.dart';

class PointsRowWidget extends StatelessWidget {
  final UserBalanceEntity balanceEntity;
  const PointsRowWidget({super.key, required this.balanceEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "#${balanceEntity.id}",
          style: CustomTextStyle.kTextStyleF14
              .copyWith(color: AppColors.textColorGrey),
        ),
        Gap(15.w),
        Text(
          balanceEntity.amount.toString(),
          style: CustomTextStyle.kTextStyleF14
              .copyWith(color: AppColors.textColorGrey),
        ),
        Text(
          DateTime.parse(balanceEntity.date!).stringFormat(DateFormatType.shortDate),
          style: CustomTextStyle.kTextStyleF14
              .copyWith(color: AppColors.textColorGrey),
        ),
      ],
    );
  }
}
