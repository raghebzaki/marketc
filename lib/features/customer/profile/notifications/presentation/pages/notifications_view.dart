import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/app_colors.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../generated/l10n.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  List<bool> isClick = [
    true,
    true,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: CustomAppBar(
        title: S.current.notifications,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: (){},
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.allow_notifications,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                trailing: Switch(
                  value: isClick[0],
                  activeColor: AppColors.secondary,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      isClick[0] = value;
                      if (value == false) {
                        isClick[1] = isClick[2] = isClick[3] = value;
                      }
                    });
                  },
                ),
              ),
            ),
            Gap(10.h),
            Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                leading:  SvgPicture.asset(
                  AppImages.discount,
                  height: 24.h,
                  width: 24.w,
                ),
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.offers_and_discounts,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                trailing:Switch(
                  value: isClick[1],
                  activeColor: AppColors.secondary,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    if (isClick[0] == false) {
                       null;
                    } else {
                      setState(() {
                        isClick[1] = value;
                      });
                    }
                  },
                ),
              ),
            ),
            Gap(10.h),
            Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                leading:  SvgPicture.asset(
                  AppImages.updates,
                  height: 24.h,
                  width: 24.w,
                ),
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.new_updates,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                trailing: Switch(
                  value: isClick[2],
                  activeColor: AppColors.secondary,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    if (isClick[0] == false) {
                       null;
                    } else {
                      setState(() {
                        isClick[2] = value;
                      });
                    }
                  },
                ),
              ),
            ),
            Gap(10.h),
            Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: ListTile(
                leading:  SvgPicture.asset(
                  AppImages.orderState,
                  height: 24.h,
                  width: 24.w,
                ),
                title:Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.current.status_of_orders,
                    style: CustomTextStyle.kTextStyleF16.copyWith(color: AppColors.textColorSecondary),
                  ),
                ) ,
                trailing: Switch(
                  value: isClick[3],
                  activeColor: AppColors.secondary,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    if (isClick[0] == false) {
                       null;
                    } else {
                      setState(() {
                        isClick[3] = value;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
