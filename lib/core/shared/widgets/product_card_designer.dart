import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../config/themes/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class ProductCardDesigner extends StatelessWidget {
  const ProductCardDesigner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(productDetailsPageRoute);
      },
      child: Container(
        width: 160.w,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.r8,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/160x130"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(Dimensions.p8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            // constraints:BoxConstraints(
                            //
                            //   maxWidth: double.infinity/2-50.sp
                            // ),
                            child: Text(
                              'ملابس قصيرة',
                              style: CustomTextStyle.kTextStyleF12
                                  .copyWith(color: AppColors.textColor),
                            ),
                          ),
                          Text(
                            'تطريز شعارات',
                            style: CustomTextStyle.kTextStyleF12
                                .copyWith(color: AppColors.textColorSecondary),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 48.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Text("هل أنت متأكد أنك تريد حذف المنتج  ؟",
                                                style: CustomTextStyle.kTextStyleF16.copyWith(
                                                    color: AppColors.textColorSecondary)),
                                          ],
                                        ),
                                        Gap(30.h),
                                        GestureDetector(
                                          onTap: () {
                                            context.pop();
                                          },
                                          child: Container(
                                            color:Colors.red[50],
                                            padding: EdgeInsets.symmetric(vertical: 10.h),
                                            width:double.infinity,
                                            child: Text('نعم, حذف',
                                                textAlign:TextAlign.center,
                                                style: CustomTextStyle.kTextStyleF16
                                                    .copyWith(
                                                    color: AppColors.textColorSecondary)),
                                          ),
                                        ),
                                        Gap(20.h),
                                        GestureDetector(
                                          onTap: () {
                                            context.pop();
                                          },
                                          child: Text('اغلاق',
                                              style: CustomTextStyle.kTextStyleF16
                                                  .copyWith(
                                                  color: AppColors
                                                      .textColorSecondary)),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child:  Icon(
                            Icons.delete,color: Colors.red,
                            size: 24.sp,
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '140.00 ${S.current.sar}',
                        style: CustomTextStyle.kTextStyleF12
                            .copyWith(color: AppColors.lightBlue),
                      ),
                      Gap(8.w),
                      Text(
                        '-30%',
                        style: CustomTextStyle.kTextStyleF12
                            .copyWith(color: AppColors.discountNumber),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 152.w,
              height: 32.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.r8,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  S.of(context).edit_product,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.kTextStyleF12.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
