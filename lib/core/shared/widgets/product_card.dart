import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/helpers/cache_helper.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/arguments.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';
import 'package:marketc/core/utils/app_constants.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../config/themes/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductCard({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(productDetailsPageRoute,
            arguments: ProductsEntityArgs(productEntity: productEntity));
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
            CachedNetworkImage(
              imageUrl: AppConstants.imageUrl + productEntity.image!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          AppConstants.imageUrl + productEntity.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondary,
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(Dimensions.p8),
              child: Column(
                children: [
                  Text(
                    CacheHelper.isEnglish()
                        ? productEntity.nameEn!
                        : productEntity.nameAr!,
                    style: CustomTextStyle.kTextStyleF12
                        .copyWith(color: AppColors.textColor),
                  ),
                  Text(
                    productEntity.subCategoryId == 2
                        ? S.current.custom_phrases
                        : S.current.custom_logo,
                    style: CustomTextStyle.kTextStyleF12
                        .copyWith(color: AppColors.textColorSecondary),
                  ),
                  Text(
                    '178 عملية شراء',
                    style: CustomTextStyle.kTextStyleF12
                        .copyWith(color: AppColors.textColorSecondary),
                  ),
                  productEntity.discountPercent == 0
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${productEntity.price} ${S.current.sar}',
                              style: CustomTextStyle.kTextStyleF12
                                  .copyWith(color: AppColors.lightBlue),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${productEntity.priceAfterDiscount} ${S.current.sar}',
                              style: CustomTextStyle.kTextStyleF12
                                  .copyWith(color: AppColors.lightBlue),
                            ),
                            Gap(8.w),
                            Text(
                              "${productEntity.discountPercent!}%",
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
                  S.current.view_details,
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
