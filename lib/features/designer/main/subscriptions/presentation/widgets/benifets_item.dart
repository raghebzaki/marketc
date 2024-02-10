import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';

class BenefitsItem extends StatelessWidget {
  final String benefit;
  const BenefitsItem({
    super.key,
    required this.benefit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.p5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            MdiIcons.checkCircle,
            color: AppColors.successColor,
          ),
          Expanded(
            child: Text(
              benefit,
              style: CustomTextStyle.kTextStyleF8,
            ),
          ),
        ],
      ),
    );
  }
}
