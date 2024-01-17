import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/widgets/product_card_designer.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class DesignerCategoriesView extends StatefulWidget {
  const DesignerCategoriesView({super.key});

  @override
  State<DesignerCategoriesView> createState() => _DesignerCategoriesViewState();
}

class _DesignerCategoriesViewState extends State<DesignerCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primary,
      appBar:  const CustomAppBar(
        title: 'my Products',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.p16.w,
                            vertical: Dimensions.p5.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Text(
                          S.of(context).all,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Gap(10.h),
                      Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.p16.w,
                            vertical: Dimensions.p5.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Text(
                          S.current.short_cloths,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Gap(10.h),
                      Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.p16.w,
                            vertical: Dimensions.p5.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Text(
                          S.current.short_cloths,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Gap(10.h),
                      Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.p16.w,
                            vertical: Dimensions.p5.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Text(
                          S.current.short_cloths,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(15.h),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 2.0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2 / 3,
                  children: [
                    ...List.generate(
                      10,
                          (index) {
                        return const ProductCardDesigner();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
