import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/product_card.dart';
import 'package:marketc/core/utils/app_colors.dart';

import '../../../../../core/shared/widgets/custom_search_form_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 21,
                    ),
                    Gap(10.w),
                    const Expanded(
                      child: SizedBox(
                        height: 35,
                        child: CustomSearchFormField(
                          borderRadius: 8,
                          label: 'بما تفكر؟',
                          sufIcon: Icon(Icons.search),
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
                  'مرحبا بك في عالم التسوق',
                  style: CustomTextStyle.kTextStyleF20,
                ),
                Text(
                  'دعنا نساعدك في العثور على الملابس المناسبة لك\nوتطريز الشعار والعبارات التي تحبها',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: 300.w,
                              height: 150,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF8E7DE),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'قريبا',
                                            style: CustomTextStyle.kTextStyleF8,
                                          ),
                                          Text(
                                            'تطريز شعارات',
                                            style: CustomTextStyle.kTextStyleF16,
                                          ),
                                          Text(
                                            'مجموعة واسعة من الشعارات والعبارات المميزة التي يتم تطريزها بشكل فريد ومميز',
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyle.kTextStyleF10,
                                          ),
                                          Container(
                                            width: 82.w,
                                            height: 18.h,
                                            decoration: ShapeDecoration(
                                              color: AppColors.secondary,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'تصفح الآن',
                                                style:
                                                    CustomTextStyle.kTextStyleF8,
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
                  'الأقسام',
                  textAlign: TextAlign.right,
                  style: CustomTextStyle.kTextStyleF16,
                ),
                Gap(10.h),
                Row(
                  children: [
                    Text(
                      'الأكثر شيوعاً',
                      textAlign: TextAlign.right,
                      style: CustomTextStyle.kTextStyleF16,
                    ),
                    const Spacer(),
                    Text(
                      'المزيدً',
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
                            padding: EdgeInsets.all(8.0),
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
                      'صدر حديثاً',
                      textAlign: TextAlign.right,
                      style: CustomTextStyle.kTextStyleF16,
                    ),
                    const Spacer(),
                    Text(
                      'المزيدً',
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
                            padding: EdgeInsets.all(8.0),
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
