import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../config/themes/app_text_styles.dart';
import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => Size(double.infinity.w, 56.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Intl.getCurrentLocale() == "ar"
                ? Icon(
                    MdiIcons.chevronRight,
                    size: 16.sp,
                    color: AppColors.lightBlue,
                  )
                : Icon(
                    MdiIcons.chevronLeft,
                    size: 16.sp,
                    color: AppColors.lightBlue,
                  ),
          ),
          MaxGap(70.w),
          Text(
            title,
            style: CustomTextStyle.kTextStyleF16,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
