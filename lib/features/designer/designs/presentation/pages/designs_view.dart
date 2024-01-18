import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/utils/app_images.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';

class DesignsView extends StatefulWidget {
  const DesignsView({super.key});

  @override
  State<DesignsView> createState() => _DesignsViewState();
}

class _DesignsViewState extends State<DesignsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
        title: S.of(context).designs,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Text(
              S.of(context).desgin_text,
              style:CustomTextStyle.kTextStyleF16,
            ),
          ),
          Gap(10.h),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                ...List.generate(
                  12,
                      (index) => Container(
                        padding:  EdgeInsets.all(24.sp),
                        margin: const EdgeInsets.all(2),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Container(
                          width: 60.w,
                          height: 60.w,
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.increaseImg),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
