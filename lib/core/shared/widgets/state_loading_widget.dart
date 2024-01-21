import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';

class StateLoadingWidget extends StatelessWidget {
  const StateLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(30.h),
        const CircularProgressIndicator(
          color: AppColors.secondary,
        ),
      ],
    );
  }
}
