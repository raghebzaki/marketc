import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/helpers/cache_helper.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../customer/main/home/presentation/manager/category_cubit.dart';
import '../../domain/entities/add_product_entity.dart';
import '../manager/add_product_cubit.dart' as add;
import '../manager/color/colors_cubit.dart';
import '../manager/size/sizes_cubit.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController productNameArCtrl = TextEditingController();
  TextEditingController productNameEnCtrl = TextEditingController();
  TextEditingController productDescriptionArCtrl = TextEditingController();
  TextEditingController productDescriptionEnCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController productDiscountCtrl = TextEditingController();
  TextEditingController quantityCtrl = TextEditingController();
  num catId = 0;
  bool customLogo = true;
  List<int> colorIds = [];
  List<int> sizeIds = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<add.AddProductCubit>(),
        ),
        BlocProvider(
          create: (context) => di.di<CategoryCubit>()..getAllCategory(),
        ),
        BlocProvider(
          create: (context) => di.di<SizesCubit>()..getSizes(),
        ),
        BlocProvider(
          create: (context) => di.di<ColorsCubit>()..getColors(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: CustomAppBar(title: S.of(context).add_product),
        body: Form(
          key: formKey,
          child: SafeArea(
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
                      validator: (value) {
                        if (productNameEnCtrl.text.isEmpty) {
                          return S.of(context).product_name_required;
                        } else if (productNameEnCtrl.length < 5) {
                          return S.of(context).product_name_short;
                        }
                        return null;
                      },
                    ),
                    Gap(10.h),
                    CustomFormField(
                      ctrl: productNameArCtrl,
                      label: S.of(context).product_name_ar,
                      validator: (value) {
                        if (productNameArCtrl.text.isEmpty) {
                          return S.of(context).product_name_required;
                        } else if (productNameArCtrl.length < 5) {
                          return S.of(context).product_name_short;
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (productDescriptionEnCtrl.text.isEmpty) {
                          return S.of(context).product_des_required;
                        } else if (productDescriptionEnCtrl.length < 50) {
                          return S.of(context).product_des_short;
                        }
                        return null;
                      },
                    ),
                    Gap(10.h),
                    TextFormField(
                      controller: productDescriptionArCtrl,
                      enabled: true,
                      maxLines: null,
                      onChanged: (value) {},
                      style: CustomTextStyle.kFormFieldTextStyle,
                      decoration: InputDecoration(
                        labelText: S.of(context).product_des_ar,
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
                      validator: (value) {
                        if (productDescriptionArCtrl.text.isEmpty) {
                          return S.of(context).product_des_required;
                        } else if (productDescriptionArCtrl.length < 50) {
                          return S.of(context).product_des_short;
                        }
                        return null;
                      },
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        Flexible(
                          child: CustomFormField(
                            ctrl: productPriceCtrl,
                            label: S.of(context).product_price,
                            validator: (value) {
                              if (productPriceCtrl.text.isEmpty) {
                                return S.of(context).product_price_required;
                              }
                              return null;
                            },
                          ),
                        ),
                        Gap(10.w),
                        Flexible(
                          child: CustomFormField(
                            ctrl: productDiscountCtrl,
                            label: S.of(context).discount_percentage,
                            validator: (value) {
                              if (productDiscountCtrl.text.isEmpty) {
                                return S.of(context).product_discount_required;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    CustomFormField(
                      ctrl: quantityCtrl,
                      label: S.of(context).qty,
                      validator: (value) {
                        if (productDiscountCtrl.text.isEmpty) {
                          return S.of(context).product_qty_required;
                        }
                        return null;
                      },
                    ),
                    Gap(10.h),
                    BlocConsumer<CategoryCubit, CategoryState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (state) {
                            catId = state![0].id!;
                          },
                          orElse: () {
                            return null;
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          success: (state) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    state!.length,
                                    (index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p8.w),
                                        child: GestureDetector(
                                          onTap: () {
                                            catId = state[index].id!;
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 85.w,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: catId == state[index].id!
                                                  ? AppColors.secondary
                                                  : Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.r8)),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Dimensions.p12.w),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    CacheHelper.isEnglish()
                                                        ? state[index].nameEn!
                                                        : state[index].nameAr!,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyle
                                                        .kTextStyleF14,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          loading: () {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          error: (errCode, err) {
                            return StateErrorWidget(
                              errCode: errCode!,
                              err: err!,
                            );
                          },
                          orElse: () {
                            return const SizedBox.shrink();
                          },
                        );
                      },
                    ),
                    Gap(20.h),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                customLogo = true;
                              });
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: customLogo
                                      ? AppColors.secondary
                                      : AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.secondary,
                                  )),
                              child: Center(
                                child: AutoSizeText(
                                  S.of(context).custom_logo,
                                  style: CustomTextStyle.kTextStyleF12,
                                  maxLines: 1,
                                  minFontSize: 8,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                customLogo = false;
                              });
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: customLogo
                                      ? AppColors.primary
                                      : AppColors.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.secondary,
                                  )),
                              child: Center(
                                child: AutoSizeText(
                                  S.of(context).custom_phrases,
                                  style: CustomTextStyle.kTextStyleF12,
                                  maxLines: 1,
                                  minFontSize: 8,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    Text(
                      S.current.sizes,
                      style: CustomTextStyle.kTextStyleF14,
                    ),
                    Gap(10.h),
                    BlocConsumer<SizesCubit, SizesStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return state.maybeWhen(
                          success: (state) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    state.length,
                                    (index) => Padding(
                                      padding:
                                          const EdgeInsets.all(Dimensions.p5),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (sizeIds
                                              .contains(state[index].id)) {
                                            sizeIds.remove(state[index].id);
                                            setState(() {});
                                          } else {
                                            sizeIds
                                                .add(state[index].id!.toInt());
                                            setState(() {});
                                          }
                                        },
                                        child: sizeIds.contains(state[index].id)
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(50),
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                    color:
                                                        AppColors.statusGreen,
                                                    width: 5,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CircleAvatar(
                                                  radius: Dimensions.r20,
                                                  backgroundColor:
                                                      AppColors.greyLight,
                                                  child: Text(
                                                    CacheHelper.isEnglish()
                                                        ? state[index].nameEn!
                                                        : state[index].nameAr!,
                                                    style: CustomTextStyle
                                                        .kTextStyleF14
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : CircleAvatar(
                                                radius: Dimensions.r20,
                                                backgroundColor:
                                                    AppColors.greyLight,
                                                child: Text(
                                                  CacheHelper.isEnglish()
                                                      ? state[index].nameEn!
                                                      : state[index].nameAr!,
                                                  style: CustomTextStyle
                                                      .kTextStyleF14
                                                      .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          loading: () {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          error: (errCode, err) {
                            return StateErrorWidget(
                              errCode: errCode,
                              err: err,
                            );
                          },
                          orElse: () {
                            return const SizedBox.shrink();
                          },
                        );
                      },
                    ),
                    Gap(10.h),
                    Text(
                      S.current.colors,
                      style: CustomTextStyle.kTextStyleF14,
                    ),
                    Gap(10.h),
                    BlocConsumer<ColorsCubit, ColorsStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return state.maybeWhen(
                          success: (state) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    state.length,
                                    (index) => Padding(
                                      padding:
                                          const EdgeInsets.all(Dimensions.p5),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (colorIds
                                              .contains(state[index].id)) {
                                            colorIds.remove(state[index].id);
                                            setState(() {});
                                          } else {
                                            colorIds
                                                .add(state[index].id!.toInt());
                                            setState(() {});
                                          }
                                        },
                                        child: colorIds
                                                .contains(state[index].id)
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(50),
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                    color:
                                                        AppColors.statusGreen,
                                                    width: 5,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CircleAvatar(
                                                  radius: Dimensions.r20,
                                                  backgroundColor: Color(int.parse(
                                                      "0xFF${state[index].color}")),
                                                ),
                                              )
                                            : CircleAvatar(
                                                radius: Dimensions.r20,
                                                backgroundColor: Color(int.parse(
                                                    "0xFF${state[index].color}")),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          loading: () {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          error: (errCode, err) {
                            return StateErrorWidget(
                              errCode: errCode,
                              err: err,
                            );
                          },
                          orElse: () {
                            return const SizedBox.shrink();
                          },
                        );
                      },
                    ),
                    Gap(10.h),
                    BlocConsumer<add.AddProductCubit, add.AddProductStates>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (state) {
                            context.defaultSnackBar(
                                S.of(context).product_added_success);
                          },
                          error: (errCode, err) {
                            context.defaultSnackBar(
                                "${S.current.err_code}: $errCode, $err");
                          },
                          orElse: () {
                            return null;
                          },
                        );
                      },
                      builder: (context, state) {
                        add.AddProductCubit addProductCubit =
                            add.AddProductCubit.get(context);
                        return Column(
                          children: [
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
                                                style: CustomTextStyle
                                                    .kTextStyleF14
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
                                              style: CustomTextStyle
                                                  .kTextStyleF14
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
                                condition: state is! add.Loading,
                                builder: (BuildContext context) {
                                  return CustomBtn(
                                    label: S.of(context).add_product_btn,
                                    onPressed: () {
                                      if (colorIds.isEmpty) {
                                        context.defaultSnackBar(
                                            S.of(context).product_color_required);
                                      } else if (sizeIds.isEmpty) {
                                        context.defaultSnackBar(
                                            S.of(context).product_size_required);
                                      } else if (addProductCubit
                                          .base64Images.isEmpty) {
                                        context.defaultSnackBar(
                                            S.of(context).product_image_required);
                                      } else {
                                        if (formKey.currentState!.validate()) {
                                          addProductCubit.addDesignerProduct(
                                            AddProductEntity(
                                              product: ProductEntity(
                                                categoryId: catId,
                                                subCategoryId:
                                                    customLogo ? 3 : 2,
                                                nameAr: productNameArCtrl.text,
                                                nameEn: productNameEnCtrl.text,
                                                price: productPriceCtrl.text,
                                                quantity: int.parse(
                                                    quantityCtrl.text),
                                                discountPercent: int.parse(
                                                    productDiscountCtrl.text),
                                                sendSize: sizeIds,
                                                sendColor: colorIds,
                                                descriptionAr:
                                                    productDescriptionArCtrl
                                                        .text,
                                                descriptionEn:
                                                    productDescriptionEnCtrl
                                                        .text,
                                                imagesBase64: addProductCubit
                                                    .base64Images,
                                                image: addProductCubit
                                                    .base64Images[0],
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                  );
                                },
                                fallback: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                })
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
