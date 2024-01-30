import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../domain/entities/add_product_entity.dart';
import '../../domain/entities/color_entity.dart';
import '../../domain/entities/size_entity.dart';
import '../manager/add_product_cubit.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
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

  TextEditingController productNameArCtrl = TextEditingController();
  TextEditingController productNameEnCtrl = TextEditingController();
  TextEditingController productDescriptionArCtrl = TextEditingController();
  TextEditingController productDescriptionEnCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController productDiscountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<AddProductCubit>(),
      child: BlocConsumer<AddProductCubit, AddProductStates>(
        listener: (context, state) {
          state.maybeWhen(
            error: (errCode, err) {
              return context
                  .defaultSnackBar("${S.current.err_code}: $errCode, $err");
            },
            orElse: () {
              return null;
            },
          );
        },
        builder: (context, state) {
          AddProductCubit addProductCubit = AddProductCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: CustomAppBar(title: S.of(context).add_product),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(25.h),
                      CustomFormField(
                        ctrl: productNameEnCtrl,
                        label: S.of(context).product_name,
                      ),
                      Gap(10.h),
                      CustomFormField(
                        ctrl: productNameArCtrl,
                        label: "Arabic Product Name",
                      ),
                      Gap(10.h),
                      TextFormField(
                        controller: productDescriptionEnCtrl,
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
                      TextFormField(
                        controller: productDescriptionArCtrl,
                        enabled: true,
                        maxLines: null,
                        onChanged: (value) {},
                        style: CustomTextStyle.kFormFieldTextStyle,
                        decoration: InputDecoration(
                          labelText: "Arabic Product Description",
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
                              ctrl: productPriceCtrl,
                              label: S.of(context).product_price,
                            ),
                          ),
                          Gap(10.w),
                          Flexible(
                            child: CustomFormField(
                              ctrl: productDiscountCtrl,
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
                                    style:
                                        CustomTextStyle.kTextStyleF14.copyWith(
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
                      GestureDetector(
                        onTap: () {
                          addProductCubit.pickPhotoDialog(context);
                        },
                        child: addProductCubit.selectedImages == []
                            ? DottedBorder(
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
                                      Expanded(
                                        child: Text(
                                          addProductCubit.image!.name,
                                          style: CustomTextStyle.kTextStyleF14
                                              .copyWith(
                                            color: AppColors.greyColor,
                                          ),
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
                              )
                            : DottedBorder(
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
                                        style: CustomTextStyle.kTextStyleF14
                                            .copyWith(
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
                      ),
                      ConditionalBuilder(
                          condition: state is! Loading,
                          builder: (BuildContext context) {
                            return CustomBtn(
                              label: "Add Product",
                              onPressed: () {
                                addProductCubit.addDesignerProduct(
                                  AddProductEntity(
                                    product: ProductEntity(
                                      categoryId: 1,
                                      subCategoryId: 2,
                                      nameAr: productNameArCtrl.text,
                                      nameEn: productNameEnCtrl.text,
                                      price: productPriceCtrl.text,
                                      quantity: 20,
                                      discountPercent:
                                          int.parse(productDiscountCtrl.text),
                                      color: const [
                                        ProductColorsEntity(
                                          id: 4,
                                        ),
                                        ProductColorsEntity(
                                          id: 5,
                                        ),
                                      ],
                                      size: const [
                                        ProductSizesEntity(
                                          id: 1,
                                        ),
                                        ProductSizesEntity(
                                          id: 3,
                                        ),
                                      ],
                                      descriptionAr:
                                          productDescriptionArCtrl.text,
                                      descriptionEn:
                                          productDescriptionEnCtrl.text,
                                      image: addProductCubit.base64Image,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          fallback: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
