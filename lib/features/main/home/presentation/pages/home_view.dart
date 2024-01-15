import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.p10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: Dimensions.r21,
                    ),
                    Gap(10.w),
                    Expanded(
                      child: SizedBox(
                        height: 35.h,
                        child: CustomSearchFormField(
                          borderRadius: Dimensions.r8,
                          label: S.current.you_think,
                          sufIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                    Gap(10.w),
                    Icon(
                      Icons.notifications_none,
                      size: 20.sp,
                    ),
                  ],
                ),
                Text(
                  S.current.shopping_world,
                  style: CustomTextStyle.kTextStyleF20,
                ),
                Text(
                  S.current.slogan,
                  textAlign: TextAlign.right,
                  style: CustomTextStyle.kTextStyleF14
                      .copyWith(color: AppColors.textColor),
                ),
                Gap(10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.p8),
                            child: Container(
                              width: 300.w,
                              height: 150,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF8E7DE),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.r8)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(Dimensions.p5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S.current.soon,
                                            style: CustomTextStyle.kTextStyleF8,
                                          ),
                                          Text(
                                            S.current.custom_logo,
                                            style:
                                                CustomTextStyle.kTextStyleF16,
                                          ),
                                          Text(
                                            S.current.wide_range,
                                            textAlign: TextAlign.right,
                                            style:
                                                CustomTextStyle.kTextStyleF10,
                                          ),
                                          Container(
                                            width: 82.w,
                                            height: 18.h,
                                            decoration: ShapeDecoration(
                                              color: AppColors.secondary,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.r4)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                S.current.browse_now,
                                                style: CustomTextStyle
                                                    .kTextStyleF8,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 140.w,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://via.placeholder.com/140x140"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
                Text(
                  S.current.categories,
                  textAlign: TextAlign.right,
                  style: CustomTextStyle.kTextStyleF16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        3,
                            (index) {
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: 85.w,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color:  Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 48.w,
                                      height: 48.w,
                                      child: SvgPicture.asset(
                                        AppImages.category3,
                                        width: 48.w,
                                        height: 48.w,
                                      ),
                                    ),
                                    Text(
                                      'ملابس قصيرة',
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.kTextStyleF14,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
                Row(
                  children: [
                    Text(
                      S.current.popular,
                      textAlign: TextAlign.right,
                      style: CustomTextStyle.kTextStyleF16,
                    ),
                    const Spacer(),
                    Text(
                      S.current.more,
                      textAlign: TextAlign.right,
                      style: CustomTextStyle.kTextStyleF14
                          .copyWith(color: AppColors.lightBlue),
                    ),
                    Gap(10.w),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24.sp,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p8),
                            child: ProductCard(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
                Row(
                  children: [
                    Text(
                      S.current.new_releases,
                      textAlign: TextAlign.right,
                      style: CustomTextStyle.kTextStyleF16,
                    ),
                    const Spacer(),
                    Text(
                      S.current.more,
                      textAlign: TextAlign.right,
                      style: CustomTextStyle.kTextStyleF14
                          .copyWith(color: AppColors.lightBlue),
                    ),
                    Gap(10.w),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24.sp,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p8),
                            child: ProductCard(),
                          );
                        },
                      ),
                    ],
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
