import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/helpers/cache_helper.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/models/user_data_model.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../generated/l10n.dart';

class DesignerProfileView extends StatelessWidget {
  const DesignerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0.h), // here the desired height
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Column(
              children: [
                Text(
                  UserData.name!,
                  style: CustomTextStyle.kTextStyleF20,
                ),
              ],
            ),
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  context.pushNamed(loginPageRoute);
                  CacheHelper.removeData("email");
                  CacheHelper.removeData("pass");
                },
                icon: Icon(
                  Icons.logout,
                  color: AppColors.lightBlue,
                  size: 16.sp,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(10.h),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0.sp),
                  child: ListTile(
                    onTap: () {
                      context.pushNamed(editProfilePageRoute);
                    },
                    title: Opacity(
                      opacity: 0.90,
                      child: Text(
                        S.current.user_profile,
                        style: CustomTextStyle.kTextStyleF16
                            .copyWith(color: AppColors.textColorSecondary),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.lightBlue,
                      size: 16.sp,
                    ),
                  ),
                ),
                Gap(10.h),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0.sp),
                  child: ListTile(
                    onTap: () {
                      context.pushNamed(userBalancePageRoute);
                    },
                    title: Opacity(
                      opacity: 0.90,
                      child: Text(
                        S.of(context).user_balance,
                        style: CustomTextStyle.kTextStyleF16
                            .copyWith(color: AppColors.textColorSecondary),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.lightBlue,
                      size: 16.sp,
                    ),
                  ),
                ),
                Gap(10.h),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0.sp),
                  child: ListTile(
                    onTap: () {
                      context.pushNamed(designerSettingPageRoute);
                    },
                    title: Opacity(
                      opacity: 0.90,
                      child: Text(
                        S.current.settings,
                        style: CustomTextStyle.kTextStyleF16
                            .copyWith(color: AppColors.textColorSecondary),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.lightBlue,
                      size: 16.sp,
                    ),
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
