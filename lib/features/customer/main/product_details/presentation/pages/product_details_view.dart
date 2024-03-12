import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/helpers/cache_helper.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../designer/product/add_product/domain/entities/color_entity.dart';
import '../../../../../designer/product/add_product/domain/entities/size_entity.dart';
import '../manager/add_favorite_cubit.dart';
import '../widgets/image_stack.dart';
import '../widgets/selections_column.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductEntity productEntity;

  const ProductDetailsView({super.key, required this.productEntity});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isFavorite = false;
  int quantity = 1;
  num colorId = 0;
  num sizeId = 0;
  ProductSizesEntity sizesEntity = const ProductSizesEntity();
  ProductColorsEntity colorsEntity = const ProductColorsEntity();
  int imageCtrl = 0;
  String htmlEnContent = "";
  String htmlArContent = "";
  String cleanedHtmlArContent = "";
  String cleanedHtmlEnContent = "";

  formatDescription() {
    setState(
      (() {
        htmlEnContent = widget.productEntity.descriptionEn!;
        cleanedHtmlEnContent = htmlEnContent.replaceAll(RegExp(r'<[^>]*>'), '');
        htmlArContent = widget.productEntity.descriptionAr!;
        cleanedHtmlArContent = htmlArContent.replaceAll(RegExp(r'<[^>]*>'), '');
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    formatDescription();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<AddFavoriteCubit>()
            ..checkFavorite(UserData.id, widget.productEntity.id),
        ),
      ],
      child: BlocConsumer<AddFavoriteCubit, AddFavoriteStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(
                    Dimensions.p16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageStack(
                        productImages: widget.productEntity.images!,
                        mainImg: widget.productEntity.image!,
                        productEntity: widget.productEntity,
                        imgIndexCtrl: imageCtrl,
                        isFavorite: isFavorite,
                      ),
                      Gap(35.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              CacheHelper.isEnglish()
                                  ? widget.productEntity.nameEn!
                                  : widget.productEntity.nameAr!,
                              style: CustomTextStyle.kTextStyleF20,
                            ),
                          ),
                          Gap(20.w),
                          widget.productEntity.discountPercent == 0
                              ? Text(
                                  "${widget.productEntity.price} ${S.current.sar}",
                                  style: CustomTextStyle.kTextStyleF18.copyWith(
                                    color: AppColors.lightBlue,
                                  ),
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.productEntity.priceAfterDiscount} ${S.current.sar}",
                                      style: CustomTextStyle.kTextStyleF18
                                          .copyWith(
                                        color: AppColors.lightBlue,
                                      ),
                                    ),
                                    Text(
                                      "${widget.productEntity.price} ${S.current.sar}",
                                      style: CustomTextStyle.kTextStyleF16
                                          .copyWith(
                                        color: AppColors.greyColor,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: AppColors.greyColor,
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                      Gap(10.h),
                      Text(
                        S.current.custom_phrases,
                        style: CustomTextStyle.kTextStyleF10.copyWith(
                          color: AppColors.black60,
                        ),
                      ),

                      Html(
                        data: CacheHelper.isEnglish()
                            ? cleanedHtmlEnContent
                            : cleanedHtmlArContent,
                      ),
                      // Text(
                      //   S.current.product_des,
                      //   style: CustomTextStyle.kTextStyleF12.copyWith(
                      //     color: AppColors.black60,
                      //   ),
                      // ),
                      SelectionsColumn(
                        productEntity: widget.productEntity,
                        colorsEntity: colorsEntity,
                        sizesEntity: sizesEntity,
                        qty: quantity,
                      ),
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
