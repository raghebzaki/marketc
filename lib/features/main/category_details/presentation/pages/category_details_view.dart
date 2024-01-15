import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';

class CategoryDetailsView extends StatefulWidget {
  final num id;

  const CategoryDetailsView({
    super.key,
    required this.id,
  });

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primary,
      appBar:  CustomAppBar(
        title: S.of(context).short_cloth_category,
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
                CustomSearchFormField(
                  label: S.current.you_think,
                  sufIcon: Icon(MdiIcons.magnify, size: 18.sp),
                ),
                Row(
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
                        S.current.custom_phrases,
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
                        S.current.custom_logo,
                        style: CustomTextStyle.kTextStyleF14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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
                        return const ProductCard();
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
