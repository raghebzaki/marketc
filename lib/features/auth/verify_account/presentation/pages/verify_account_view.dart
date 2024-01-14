import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';

class VerifyAccountView extends StatefulWidget {
  const VerifyAccountView({super.key});

  @override
  State<VerifyAccountView> createState() => _VerifyAccountViewState();
}

class _VerifyAccountViewState extends State<VerifyAccountView> {
  TextEditingController pinCtrl = TextEditingController();
  bool timer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(90.h),
              Text(
                S.current.verify_code,
                style: CustomTextStyle.kTextStyleF20.copyWith(
                  color: AppColors.black80,
                ),
              ),
              Text(
                S.current.verify_code_sent,
                style: CustomTextStyle.kTextStyleF16.copyWith(
                  color: AppColors.black60,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.p30.h),
                child: Pinput(
                  controller: pinCtrl,
                  onChanged: (value) {
                    // UserData.otp = value;
                  },
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  focusNode: FocusNode(),
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.primary,
                      border: Border.all(
                        color: AppColors.secondary,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimensions.r20,
                      ),
                    ),
                    textStyle: CustomTextStyle.kPinTextStyle,
                  ),
                ),
              ),
              ConditionalBuilder(
                condition: timer == true,
                builder: (BuildContext context) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        timer = !timer;
                      });
                      // context.pushNamed(resetPassPageRoute);
                    },
                    child: Center(
                      child: Text(
                        S.current.resend_code,
                        style: CustomTextStyle.kTextStyleF14,
                      ),
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: const CircularProgressIndicator(
                          color: AppColors.secondary,
                        ),
                      ),
                      Gap(10.w),
                      TimerCountdown(
                        format: CountDownTimerFormat.minutesSeconds,
                        enableDescriptions: false,
                        spacerWidth: 0,
                        timeTextStyle: CustomTextStyle.kTextStyleF14,
                        endTime: DateTime.now().add(
                          const Duration(
                            minutes: 1,
                            seconds: 1,
                          ),
                        ),
                        onEnd: () {
                          setState(() {
                            timer = !timer;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              Gap(35.h),
              Center(
                child: Image.asset(
                  AppImages.resetPassImg,
                  height: 250.h,
                  width: 250.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
