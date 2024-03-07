import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/designer/product/add_product/domain/entities/color_entity.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/helpers/cache_helper.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/cubits/cart_cubit/cart_cubit.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../designer/product/add_product/domain/entities/size_entity.dart';

class SelectionsColumn extends StatefulWidget {
  final ProductEntity productEntity;
  final int qty;
  ProductColorsEntity colorsEntity;
  ProductSizesEntity sizesEntity;

  SelectionsColumn({
    super.key,
    required this.productEntity,
    required this.colorsEntity,
    required this.sizesEntity,
    required this.qty,
  });

  @override
  State<SelectionsColumn> createState() => _SelectionsColumnState();
}

class _SelectionsColumnState extends State<SelectionsColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: context.queryWidth / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.colors,
                    style: CustomTextStyle.kTextStyleF14.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                            widget.productEntity.color!.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(Dimensions.p5),
                              child: GestureDetector(
                                onTap: () {
                                  widget.colorsEntity =
                                      widget.productEntity.color![index];

                                  setState(() {});
                                },
                                child: widget.colorsEntity.id ==
                                        widget.productEntity.color![index].id
                                    ? Container(
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(50),
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: AppColors.statusGreen,
                                            width: 5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: Dimensions.r20,
                                          backgroundColor: Color(int.parse(
                                              '0xff${widget.productEntity.color![index].color}')),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: Dimensions.r20,
                                        backgroundColor: Color(int.parse(
                                            '0xff${widget.productEntity.color![index].color}')),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: context.queryWidth / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).sizes,
                    style: CustomTextStyle.kTextStyleF14.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                          widget.productEntity.size!.length,
                          (index) => Padding(
                              padding: const EdgeInsets.all(Dimensions.p5),
                              child: GestureDetector(
                                onTap: () {
                                  // sizeId = widget.productEntity.size![index].id!;
                                  widget.sizesEntity =
                                      widget.productEntity.size![index];
                                  setState(() {});
                                },
                                child: widget.sizesEntity.id ==
                                        widget.productEntity.size![index].id
                                    ? Container(
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(50),
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: AppColors.statusGreen,
                                            width: 5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: Dimensions.r18,
                                          backgroundColor: AppColors.greyLight,
                                          child: Text(
                                            CacheHelper.isEnglish()
                                                ? widget.productEntity
                                                    .size![index].nameEn!
                                                : widget.productEntity
                                                    .size![index].nameAr!,
                                            style: CustomTextStyle.kTextStyleF14
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: Dimensions.r20,
                                        backgroundColor: AppColors.greyLight,
                                        child: Text(
                                          CacheHelper.isEnglish()
                                              ? widget.productEntity
                                                  .size![index].nameEn!
                                              : widget.productEntity
                                                  .size![index].nameAr!,
                                          style: CustomTextStyle.kTextStyleF14
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                              )),
                        ),
                      ],
                    ),
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
            BlocBuilder<CartCubit, CartStates>(
              // listener: (context, state) {
              //   state.maybeWhen(
              //     alreadyAdded: (state) {
              //       context.defaultSnackBar(
              //           "Product already added to cart");
              //     },
              //     addedToCart: (state) {
              //       context
              //           .defaultSnackBar("Product Added to cart");
              //     },
              //     orElse: () {
              //       return null;
              //     },
              //   );
              // },
              builder: (context, state) {
                // CartCubit cartCubit = CartCubit.get(context);
                return Flexible(
                  child: CustomBtn(
                    label: S.of(context).add_to_cart,
                    fgColor: Colors.white,
                    isUpperCase: true,
                    onPressed: () {
                      // final cartCubit = context.read<CartCubit>();
                      // cartCubit.addToCart(widget.productEntity);
                      context.read<CartCubit>().addToCart(
                            ProductEntity(
                              id: widget.productEntity.id,
                              sendColor: [
                                widget.colorsEntity.id!,
                              ],
                              sendSize: [
                                widget.sizesEntity.id!,
                              ],
                              color: [
                                widget.colorsEntity,
                              ],
                              size: [
                                widget.sizesEntity,
                              ],
                              quantity: widget.productEntity.quantity,
                              userQuantity: widget.qty,
                              price: widget.productEntity.price,
                              priceAfterDiscount:
                                  widget.productEntity.priceAfterDiscount,
                              discountPercent:
                                  widget.productEntity.discountPercent,
                              image: widget.productEntity.image,
                              images: widget.productEntity.images,
                              imagesBase64: widget.productEntity.imagesBase64,
                              nameEn: widget.productEntity.nameEn,
                              nameAr: widget.productEntity.nameAr,
                              descriptionEn: widget.productEntity.descriptionEn,
                              descriptionAr: widget.productEntity.descriptionAr,
                            ),

                            // widget.productEntity
                          );
                      context.pushNamed(cartPageRoute);
                    },
                  ),
                );
              },
            ),
            Gap(20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   S.of(context).qty,
                //   style: CustomTextStyle.kTextStyleF10.copyWith(
                //     color: AppColors.black60,
                //   ),
                // ),
                // Gap(10.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.productEntity.quantity! >=
                              widget.productEntity.userQuantity!) {
                            widget.productEntity.userQuantity =
                                widget.productEntity.userQuantity! + 1;
                          } else {}
                        });
                      },
                      child: CircleAvatar(
                        radius: Dimensions.r25,
                        backgroundColor: widget.productEntity.quantity! >=
                                widget.productEntity.userQuantity!
                            ? AppColors.greyLight
                            : Colors.grey[200],
                        child: Center(
                          child: Text(
                            "+",
                            style: CustomTextStyle.kTextStyleF18.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(15.w),
                    Text(
                      "${widget.productEntity.userQuantity}",
                      style: CustomTextStyle.kTextStyleF20,
                    ),
                    Gap(15.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.productEntity.userQuantity! > 1) {
                            widget.productEntity.userQuantity =
                                widget.productEntity.userQuantity! - 1;
                          }
                        });
                      },
                      child: CircleAvatar(
                        radius: Dimensions.r25,
                        backgroundColor: AppColors.greyLight,
                        child: Center(
                          child: Text(
                            "-",
                            style: CustomTextStyle.kTextStyleF18.copyWith(
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
        ),
      ],
    );
  }
}
