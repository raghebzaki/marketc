import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_button.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.r25),
                        child: Image.network(
                          "https://via.placeholder.com/353x521",
                        ),
                      ),
                      Positioned(
                        left: 250.w,
                        top: 0,
                        right: 0,
                        bottom: 450.h,
                        child: Icon(
                          MdiIcons.heartOutline,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 250.w,
                        bottom: 450.h,
                        child: GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Icon(
                            MdiIcons.arrowLeft,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 325.h,
                        right: 250.w,
                        bottom: 0,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...List.generate(
                                3,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(Dimensions.p5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.r10),
                                    child: Image.network(
                                      "..//54x55/red",
                                    ),
                                  ),
                                ),
                              ).reversed,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.current.short_cloths,
                      style: CustomTextStyle.kTextStyleF20,
                    ),
                    Text(
                      "30.00 ${S.current.sar}",
                      style: CustomTextStyle.kTextStyleF18.copyWith(
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ],
                ),
                Text(
                  S.current.custom_phrases,
                  style: CustomTextStyle.kTextStyleF10.copyWith(
                    color: AppColors.black60,
                  ),
                ),
                Text(
                  S.current.product_des,
                  style: CustomTextStyle.kTextStyleF12.copyWith(
                    color: AppColors.black60,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: context.queryWidth/2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.colors,
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
                              ...List.generate(
                            5,
                                    (index) => const Padding(
                                  padding: EdgeInsets.all(Dimensions.p5),
                                  child: CircleAvatar(
                                    radius: Dimensions.r20,
                                    backgroundColor: AppColors.lightBlue,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      constraints: BoxConstraints(maxWidth: context.queryWidth/2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).sizes,
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
                              ...List.generate(
                                9,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(Dimensions.p5),
                                  child: CircleAvatar(
                                    radius: Dimensions.r20,
                                    backgroundColor: Colors.grey,
                                    child: Text(
                                      "S",
                                      style: CustomTextStyle.kTextStyleF14
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomBtn(
                        label: S.of(context).add_to_cart,
                        onPressed: () {},
                        fgColor: Colors.white,
                        isUpperCase: true,
                      ),
                    ),
                    Gap(20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).qty,
                          style: CustomTextStyle.kTextStyleF10.copyWith(
                            color: AppColors.black60,
                          ),
                        ),
                        Gap(10.h),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: Dimensions.r15,
                                backgroundColor: Colors.grey,
                                child: Center(
                                  child: Text(
                                    "+",
                                    style:
                                        CustomTextStyle.kTextStyleF14.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(15.w),
                            const Text("1"),
                            Gap(15.w),
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: Dimensions.r15,
                                backgroundColor: Colors.grey,
                                child: Center(
                                  child: Text(
                                    "-",
                                    style:
                                        CustomTextStyle.kTextStyleF14.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
