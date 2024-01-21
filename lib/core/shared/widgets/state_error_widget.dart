import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class StateErrorWidget extends StatelessWidget {
  final String errCode;
  final String err;


  const StateErrorWidget({
    super.key,
    required this.errCode,
    required this.err,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.p50),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(Dimensions.p16),
          decoration: BoxDecoration(
            color: AppColors.statusRedContainer,
            borderRadius: BorderRadius.circular(
              Dimensions.r25,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  color: AppColors.statusRed,
                  size: 60.0,
                ),
                Gap(10.h),
                Text(
                  'Error Occurred!',
                  style: TextStyle(
                    fontSize: Dimensions.f18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.statusRed,
                  ),
                ),
                Gap(10.h),
                Text(
                  "Error Code:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Dimensions.f20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.statusRed,
                  ),
                ),
                Text(
                  errCode,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Dimensions.f16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.statusRed,
                  ),
                ),
                Gap(10.h),
                Text(
                  err,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Dimensions.f14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.statusRed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}