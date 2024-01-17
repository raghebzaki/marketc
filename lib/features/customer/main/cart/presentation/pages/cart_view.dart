import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
        title: S.of(context).cart,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.p16),
              child: SingleChildScrollView(
              child: Column(
                children: [
                  GFListTile(
                    shadow: const BoxShadow(),
                    color: Colors.white,
                    avatar: GFAvatar(
                      size: 60.sp,
                      shape: GFAvatarShape.standard,
                      backgroundImage:
                          NetworkImage("https://via.placeholder.com/60x60"),
                    ),
                    title: Text(
                      'ملابس هودي',
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                    subTitle: Text(
                      'ملابس هودي',
                      style: CustomTextStyle.kTextStyleF12
                          .copyWith(color: AppColors.textColorSecondary),
                    ),
                    description: Row(
                      children: [
                        Text(
                          '87.00 SAR',
                          style: CustomTextStyle.kTextStyleF14
                              .copyWith(color: AppColors.textColor),
                        ),
                        const Spacer(),
                        Icon(MdiIcons.plusBoxOutline),
                        Gap(10.w),
                        Text(
                          '01',
                          style: CustomTextStyle.kTextStyleF14
                              .copyWith(color: AppColors.textColor),
                        ),
                        Gap(10.w),
                        Icon(MdiIcons.minusBoxOutline),
                      ],
                    ),
                  ),
                  GFListTile(
                    shadow: const BoxShadow(),
                    color: Colors.white,
                    avatar: GFAvatar(
                      size: 60.sp,
                      shape: GFAvatarShape.standard,
                      backgroundImage:
                          const NetworkImage("https://via.placeholder.com/60x60"),
                    ),
                    title: Text(
                      'ملابس هودي',
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                    subTitle: Text(
                      'ملابس هودي',
                      style: CustomTextStyle.kTextStyleF12
                          .copyWith(color: AppColors.textColorSecondary),
                    ),
                    description: Row(
                      children: [
                        Text(
                          '87.00 SAR',
                          style: CustomTextStyle.kTextStyleF14
                              .copyWith(color: AppColors.textColor),
                        ),
                        const Spacer(),
                        Icon(MdiIcons.plusBoxOutline),
                        Gap(10.w),
                        Text(
                          '01',
                          style: CustomTextStyle.kTextStyleF14
                              .copyWith(color: AppColors.textColor),
                        ),
                        Gap(10.w),
                        Icon(MdiIcons.minusBoxOutline),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.order_no,
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColor),
                            ),
                            const Spacer(),
                            Text(
                              '#234465',
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColor),
                            ),
                          ],
                        ),
                        Gap(16.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              S.current.total,
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColor),
                            ),
                            const Spacer(),
                            Text(
                              '113.30 SAR',
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColor),
                            ),
                          ],
                        ),
                        Gap(16.h),
                        Container(
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0x14010C0E),
                              ),
                            ),
                          ),
                        ),
                        Gap(16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.subtotal,
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColorSecondary),
                            ),
                            const Spacer(),
                            Text(
                              '109.00 SAR',
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColorSecondary),
                            ),
                          ],
                        ),
                        Gap(16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.delivery_fee,
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColorSecondary),
                            ),
                            const Spacer(),
                            Text(
                              '4.30 SAR',
                              style: CustomTextStyle.kTextStyleF14
                                  .copyWith(color: AppColors.textColorSecondary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                      ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBtn(
                label: "استكمال الدفع",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
