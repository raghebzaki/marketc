import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/helpers/cache_helper.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../customer/main/home/presentation/manager/category_cubit.dart';
import '../../../add_product/presentation/manager/color/colors_cubit.dart';
import '../../../add_product/presentation/manager/size/sizes_cubit.dart';
import '../../domain/entities/edit_product_entity.dart';
import '../manager/edit_product_cubit.dart' as edit;

class EditProductView extends StatefulWidget {
  final ProductEntity productDetails;

  const EditProductView({super.key, required this.productDetails});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  Future<String?> networkImageToBase64(String? imageUrl) async {
    http.Response response = await http.get(Uri.parse(imageUrl!));
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }

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
  List<String> basePreview = [];

  @override
  void initState() {
    super.initState();
    go(context);
  }

  go(BuildContext context) async {
    // edit.EditProductCubit editProductCubit = edit.EditProductCubit.get(context);
    productNameArCtrl =
        TextEditingController(text: widget.productDetails.nameAr);
    productNameEnCtrl =
        TextEditingController(text: widget.productDetails.nameEn);
    productDescriptionArCtrl =
        TextEditingController(text: widget.productDetails.descriptionAr);
    productDescriptionEnCtrl =
        TextEditingController(text: widget.productDetails.descriptionEn);
    productPriceCtrl = TextEditingController(text: widget.productDetails.price);
    productDiscountCtrl = TextEditingController(
        text: widget.productDetails.discountPercent.toString());
    quantityCtrl =
        TextEditingController(text: widget.productDetails.quantity.toString());
    catId = widget.productDetails.categoryId!;
    customLogo = widget.productDetails.subCategoryId == 3 ? true : false;
    for (var color in widget.productDetails.color!) {
      colorIds.add(color.id!.toInt());
    }
    for (var size in widget.productDetails.size!) {
      sizeIds.add(size.id!.toInt());
    }
    for (var image in widget.productDetails.images!) {
      String? base64 =
          await networkImageToBase64(AppConstants.imageUrl + image.image!);
      basePreview.add(base64!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<edit.EditProductCubit>(),
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
        appBar: CustomAppBar(title: S.of(context).edit_product),
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
                    ),
                    Gap(10.h),
                    CustomFormField(
                      ctrl: productNameArCtrl,
                      label: S.of(context).product_name_ar,
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
                      ctrl: quantityCtrl,
                      label: S.of(context).qty,
                    ),
                    Gap(10.h),
                    BlocConsumer<CategoryCubit, CategoryState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (state) {},
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
                    BlocConsumer<edit.EditProductCubit, edit.EditProductStates>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (state) {
                            context.defaultSnackBar(
                                S.of(context).product_added_success);
                            context.pushNamed(designerBottomNavBarPageRoute);
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
                        edit.EditProductCubit editProductCubit =
                            edit.EditProductCubit.get(context);
                        return state.maybeWhen(
                          initial: () {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                            basePreview.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Stack(
                                                    children: [
                                                      Image.memory(
                                                        //to show image, you type like this.
                                                        const Base64Decoder()
                                                            .convert(
                                                                basePreview[
                                                                    index]),
                                                        fit: BoxFit.cover,
                                                        width: 150,
                                                        height: 150,
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            editProductCubit
                                                                .xFilePick
                                                                .removeAt(
                                                                    index);
                                                            editProductCubit
                                                                .base64Images
                                                                .removeAt(
                                                                    index);
                                                            setState(() {});
                                                          },
                                                          child:
                                                              const CircleAvatar(
                                                                  radius: 10,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 20,
                                                                  )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                        Container(
                                          color: AppColors.textColorGrey,
                                          height: 150,
                                          width: 150,
                                          padding: const EdgeInsets.all(8),
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              size: 50,
                                            ),
                                            onTap: () {
                                              editProductCubit
                                                  .getImages(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ConditionalBuilder(
                                    condition: state is! edit.Loading,
                                    builder: (BuildContext context) {
                                      return CustomBtn(
                                        label: S.of(context).add_product_btn,
                                        onPressed: () {
                                          if (colorIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_color_required);
                                          } else if (sizeIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_size_required);
                                          } else if (basePreview.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_image_required);
                                          } else {
                                            editProductCubit
                                                .editDesignerProduct(
                                              EditProductEntity(
                                                product: ProductEntity(
                                                  id: widget
                                                      .productDetails.id,
                                                  categoryId: catId,
                                                  subCategoryId:
                                                  customLogo ? 3 : 2,
                                                  nameAr:
                                                  productNameArCtrl.text,
                                                  nameEn:
                                                  productNameEnCtrl.text,
                                                  price:
                                                  productPriceCtrl.text,
                                                  quantity: int.parse(
                                                      quantityCtrl.text),
                                                  discountPercent: int.parse(
                                                      productDiscountCtrl
                                                          .text),
                                                  sendSize: sizeIds,
                                                  sendColor: colorIds,
                                                  descriptionAr:
                                                  productDescriptionArCtrl
                                                      .text,
                                                  descriptionEn:
                                                  productDescriptionEnCtrl
                                                      .text,
                                                  imagesBase64: basePreview,
                                                  image: basePreview[0],
                                                ),
                                              ),
                                            );
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
                          uploadMultipleImages: (state) {
                            basePreview.addAll(state);
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                            basePreview.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Stack(
                                                    children: [
                                                      Image.memory(
                                                        //to show image, you type like this.
                                                        const Base64Decoder()
                                                            .convert(
                                                                basePreview[
                                                                    index]),
                                                        fit: BoxFit.cover,
                                                        width: 150,
                                                        height: 150,
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            editProductCubit
                                                                .xFilePick
                                                                .removeAt(
                                                                    index);
                                                            editProductCubit
                                                                .base64Images
                                                                .removeAt(
                                                                    index);
                                                            setState(() {});
                                                          },
                                                          child:
                                                              const CircleAvatar(
                                                                  radius: 10,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 20,
                                                                  )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                        Container(
                                          color: AppColors.textColorGrey,
                                          height: 150,
                                          width: 150,
                                          padding: const EdgeInsets.all(8),
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              size: 50,
                                            ),
                                            onTap: () {
                                              editProductCubit
                                                  .getImages(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ConditionalBuilder(
                                    condition: state is! edit.Loading,
                                    builder: (BuildContext context) {
                                      return CustomBtn(
                                        label: S.of(context).add_product_btn,
                                        onPressed: () {
                                          if (colorIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_color_required);
                                          } else if (sizeIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_size_required);
                                          } else if (basePreview.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_image_required);
                                          } else {
                                            if (formKey.currentState!
                                                .validate()) {
                                              editProductCubit
                                                  .editDesignerProduct(
                                                EditProductEntity(
                                                  product: ProductEntity(
                                                    id: widget
                                                        .productDetails.id,
                                                    categoryId: catId,
                                                    subCategoryId:
                                                        customLogo ? 3 : 2,
                                                    nameAr:
                                                        productNameArCtrl.text,
                                                    nameEn:
                                                        productNameEnCtrl.text,
                                                    price:
                                                        productPriceCtrl.text,
                                                    quantity: int.parse(
                                                        quantityCtrl.text),
                                                    discountPercent: int.parse(
                                                        productDiscountCtrl
                                                            .text),
                                                    sendSize: sizeIds,
                                                    sendColor: colorIds,
                                                    descriptionAr:
                                                        productDescriptionArCtrl
                                                            .text,
                                                    descriptionEn:
                                                        productDescriptionEnCtrl
                                                            .text,
                                                    imagesBase64: basePreview,
                                                    image: basePreview[0],
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
                          loading: () {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                            basePreview.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Stack(
                                                    children: [
                                                      Image.memory(
                                                        //to show image, you type like this.
                                                        const Base64Decoder()
                                                            .convert(
                                                                basePreview[
                                                                    index]),
                                                        fit: BoxFit.cover,
                                                        width: 150,
                                                        height: 150,
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            editProductCubit
                                                                .xFilePick
                                                                .removeAt(
                                                                    index);
                                                            editProductCubit
                                                                .base64Images
                                                                .removeAt(
                                                                    index);
                                                            setState(() {});
                                                          },
                                                          child:
                                                              const CircleAvatar(
                                                                  radius: 10,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 20,
                                                                  )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                        Container(
                                          color: AppColors.textColorGrey,
                                          height: 150,
                                          width: 150,
                                          padding: const EdgeInsets.all(8),
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              size: 50,
                                            ),
                                            onTap: () {
                                              editProductCubit
                                                  .getImages(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ConditionalBuilder(
                                    condition: state is! edit.Loading,
                                    builder: (BuildContext context) {
                                      return CustomBtn(
                                        label: S.of(context).add_product_btn,
                                        onPressed: () {
                                          if (colorIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_color_required);
                                          } else if (sizeIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_size_required);
                                          } else if (basePreview.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_image_required);
                                          } else {
                                            if (formKey.currentState!
                                                .validate()) {
                                              editProductCubit
                                                  .editDesignerProduct(
                                                EditProductEntity(
                                                  product: ProductEntity(
                                                    id: widget
                                                        .productDetails.id,
                                                    categoryId: catId,
                                                    subCategoryId:
                                                        customLogo ? 3 : 2,
                                                    nameAr:
                                                        productNameArCtrl.text,
                                                    nameEn:
                                                        productNameEnCtrl.text,
                                                    price:
                                                        productPriceCtrl.text,
                                                    quantity: int.parse(
                                                        quantityCtrl.text),
                                                    discountPercent: int.parse(
                                                        productDiscountCtrl
                                                            .text),
                                                    sendSize: sizeIds,
                                                    sendColor: colorIds,
                                                    descriptionAr:
                                                        productDescriptionArCtrl
                                                            .text,
                                                    descriptionEn:
                                                        productDescriptionEnCtrl
                                                            .text,
                                                    imagesBase64: basePreview,
                                                    image: basePreview[0],
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
                          success: (state) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                            basePreview.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Stack(
                                                    children: [
                                                      Image.memory(
                                                        //to show image, you type like this.
                                                        const Base64Decoder()
                                                            .convert(
                                                                basePreview[
                                                                    index]),
                                                        fit: BoxFit.cover,
                                                        width: 150,
                                                        height: 150,
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            editProductCubit
                                                                .xFilePick
                                                                .removeAt(
                                                                    index);
                                                            editProductCubit
                                                                .base64Images
                                                                .removeAt(
                                                                    index);
                                                            setState(() {});
                                                          },
                                                          child:
                                                              const CircleAvatar(
                                                                  radius: 10,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 20,
                                                                  )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                        Container(
                                          color: AppColors.textColorGrey,
                                          height: 150,
                                          width: 150,
                                          padding: const EdgeInsets.all(8),
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              size: 50,
                                            ),
                                            onTap: () {
                                              editProductCubit
                                                  .getImages(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ConditionalBuilder(
                                    condition: state is! edit.Loading,
                                    builder: (BuildContext context) {
                                      return CustomBtn(
                                        label: S.of(context).add_product_btn,
                                        onPressed: () {
                                          if (colorIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_color_required);
                                          } else if (sizeIds.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_size_required);
                                          } else if (basePreview.isEmpty) {
                                            context.defaultSnackBar(S
                                                .of(context)
                                                .product_image_required);
                                          } else {
                                            if (formKey.currentState!
                                                .validate()) {
                                              editProductCubit
                                                  .editDesignerProduct(
                                                EditProductEntity(
                                                  product: ProductEntity(
                                                    id: widget
                                                        .productDetails.id,
                                                    categoryId: catId,
                                                    subCategoryId:
                                                        customLogo ? 3 : 2,
                                                    nameAr:
                                                        productNameArCtrl.text,
                                                    nameEn:
                                                        productNameEnCtrl.text,
                                                    price:
                                                        productPriceCtrl.text,
                                                    quantity: int.parse(
                                                        quantityCtrl.text),
                                                    discountPercent: int.parse(
                                                        productDiscountCtrl
                                                            .text),
                                                    sendSize: sizeIds,
                                                    sendColor: colorIds,
                                                    descriptionAr:
                                                        productDescriptionArCtrl
                                                            .text,
                                                    descriptionEn:
                                                        productDescriptionEnCtrl
                                                            .text,
                                                    imagesBase64: basePreview,
                                                    image: basePreview[0],
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
                          error: (errCode, err) {
                            return StateErrorWidget(errCode: errCode, err: err);
                          },
                          orElse: () {
                            return const SizedBox.shrink();
                          },
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
