import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/utils/app_colors.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  // ValueKey dismissibleKey = const ValueKey(1);

  List<int> products = [
    1,
    2,
    3,
    4,
    5,
  ];

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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (ctx, index) {
                      return Dismissible(
                        key: ValueKey<int>(products[index]),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          padding: const EdgeInsets.all(Dimensions.p16),
                          decoration: BoxDecoration(
                            color: AppColors.errorColor,
                            borderRadius: BorderRadius.circular(Dimensions.r15),
                          ),
                          child: Align(
                            alignment: Intl.getCurrentLocale() == "en"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Icon(
                              MdiIcons.deleteEmpty,
                              size: 32.sp,
                            ),
                          ),
                        ),
                        // onDismissed: (direction) {
                        //   setState(() {});
                        // },
                        child: GFListTile(
                          shadow: const BoxShadow(),
                          color: Colors.white,
                          avatar: GFAvatar(
                            size: 60.sp,
                            shape: GFAvatarShape.standard,
                            backgroundImage: const NetworkImage(
                                "https://via.placeholder.com/60x60"),
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
                      );
                    },),
                    Gap(16.h),
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
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: AppColors.textColorSecondary),
                        ),
                        const Spacer(),
                        Text(
                          '109.00 SAR',
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: AppColors.textColorSecondary),
                        ),
                      ],
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.delivery_fee,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: AppColors.textColorSecondary),
                        ),
                        const Spacer(),
                        Text(
                          '4.30 SAR',
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: AppColors.textColorSecondary),
                        ),
                      ],
                    ),
                    Gap(100.h),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomBtn(
                  label: S.of(context).complete_payment,
                  onPressed: () {
                    context.pushNamed(paymentDetailsPageRoute);
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
