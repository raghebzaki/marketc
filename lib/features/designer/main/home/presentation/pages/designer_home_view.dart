import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class DesignerHomeView extends StatelessWidget {
  const DesignerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(70.0.h), // here the desired height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Text(
                'محمود شاهين',
                style: CustomTextStyle.kTextStyleF20,
              ),
              Text(
                '+970 59 533 3781',
                textAlign: TextAlign.justify,
                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorSecondary),
              )
            ],
          ),

          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Image.asset(AppImages.bellImg,width: 25.w,),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.p10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10.h),
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
                Gap(20.h),
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64.w,
                              height: 64.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.increaseImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                                'نسبة الارباح',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                                '20%',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(10.w),
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64.w,
                              height: 64.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.saleHomeImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'عمليات الشراء',
                              textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                              '120 عملية',
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              Gap(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 72.w,
                              height: 53.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.eyeImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                                'عدد المشترين',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                                '1,500,055',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(10.w),
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.moneyImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                                'محفظتي',
                              textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                              '\$ 25,001',
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
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
