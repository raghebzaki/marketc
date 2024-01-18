import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({super.key});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  List<String> sizes = ["2XL", "XL", "L", "M", "S"];

  static Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // Color randomColor = generateRandomColor();
  final List<Color> randomColors =
      List.generate(6, (index) => generateRandomColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: S.of(context).edit_product),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(25.h),
                CustomFormField(
                  label: S.of(context).product_name,
                ),

                Gap(10.h),
                TextFormField(
                  enabled: true,
                  maxLines: null,
                  onChanged: (value) {},
                  style: CustomTextStyle.kFormFieldTextStyle,
                  decoration: InputDecoration(
                    labelText: S.of(context).product_des,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Dimensions.p10.w,
                      vertical: Dimensions.p10.h,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Dimensions.r10,
                      ),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Dimensions.r10,
                      ),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: AppColors.textColorSecondary,
                    ),
                  ),
                ),
                Gap(10.h),
                Row(
                  children: [
                    Flexible(
                      child: CustomFormField(
                        label: S.of(context).product_price,
                      ),
                    ),
                    Gap(10.w),
                    Flexible(
                      child: CustomFormField(
                        label: S.of(context).discount_percentage,
                      ),
                    ),
                  ],
                ),
                CustomFormField(
                  label: S.of(context).product_category,
                ),
                Gap(10.h),
                Text(
                  S.current.sizes,
                  style: CustomTextStyle.kTextStyleF14,
                ),
                Gap(10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.all(Dimensions.p5),
                          child: CircleAvatar(
                            radius: Dimensions.r20,
                            backgroundColor: AppColors.greyLight,
                            child: Text(
                              sizes[index],
                              style: CustomTextStyle.kTextStyleF14.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ).reversed,
                    ],
                  ),
                ),
                Gap(10.h),
                Text(
                  S.current.colors,
                  style: CustomTextStyle.kTextStyleF14,
                ),
                Gap(10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.all(Dimensions.p5),
                          child: CircleAvatar(
                            radius: Dimensions.r20,
                            backgroundColor: randomColors[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
                DottedBorder(
                  // radius: Radius.circular(Dimensions.r15),
                  dashPattern: const [5],
                  color: AppColors.greyColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.p16.w,
                      vertical: Dimensions.p40.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).upload_product_img,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                        Gap(25.w),
                        Image.asset(
                          AppImages.uploadImg,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
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
