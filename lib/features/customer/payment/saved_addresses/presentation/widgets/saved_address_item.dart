import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';

class SavedAddressItem extends StatelessWidget {
  final String? label;

  const SavedAddressItem({
    super.key,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(paymentGateWayPageRoute);
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.p16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  MdiIcons.mapMarkerOutline,
                  size: 16.sp,
                  color: AppColors.lightBlue,
                ),
                Gap(5.w),
                Text(
                  label.isNullOrEmpty(),
                  style: CustomTextStyle.kTextStyleF14,
                ),
              ],
            ),
            Icon(
              MdiIcons.check,
              size: 16.sp,
              color: AppColors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
