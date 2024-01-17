import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/dimensions.dart';

import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';

class PaymentGateWayView extends StatefulWidget {
  const PaymentGateWayView({super.key});

  @override
  State<PaymentGateWayView> createState() => _PaymentGateWayViewState();
}

class _PaymentGateWayViewState extends State<PaymentGateWayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: S.current.payment),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الدفع",
                      style: CustomTextStyle.kTextStyleF20,
                    ),
                    Gap(10.h),
                    Text(
                      "لن يتم تحصيل رسوم منك إلا بعد مراجعة هذا الطلب في الخطوة التالية",
                      style: CustomTextStyle.kTextStyleF14.copyWith(
                        color: AppColors.textColorSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: CustomBtn(
                  label: S.current.processing,
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
