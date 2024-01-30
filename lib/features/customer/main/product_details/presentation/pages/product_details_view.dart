import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:marketc/core/shared/widgets/state_error_widget.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/helpers/cache_helper.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/add_favorite_cubit.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductEntity productEntity;

  const ProductDetailsView({super.key, required this.productEntity});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isFavorite =false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<AddFavoriteCubit>()..checkFavorite(UserData.id, widget.productEntity.id),
      child: BlocConsumer<AddFavoriteCubit, AddFavoriteStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          AddFavoriteCubit addFavoriteCubit = AddFavoriteCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                  Dimensions.p16,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.r25),
                              child: GFCarousel(
                                viewportFraction: 1.0,
                                items: [
                                  ...List.generate(
                                    widget.productEntity.images!.length,
                                    (index) {
                                      return Image.network(
                                        AppConstants.imageUrl +
                                            widget.productEntity.images![index]
                                                .image!,
                                      );
                                    },
                                  ),
                                ],
                                scrollDirection: Axis.horizontal,
                                aspectRatio: 1,
                              ),
                            ),
                            UserData.type=='customer'?state.maybeWhen(
                              initial: () {
                                return Positioned(
                                  left: 250.w,
                                  top: 0,
                                  right: 0,
                                  bottom: 300.h,
                                  child: GestureDetector(
                                    onTap: () {
                                      addFavoriteCubit.addFavorite(
                                          UserData.id, widget.productEntity.id);
                                    },
                                    child: Icon(
                                      MdiIcons.heartOutline,
                                    ),
                                  ),
                                );
                              },
                              successCheck: (state) {
                                isFavorite=state.status==0?false:true;
                                return Positioned(
                                  left: 250.w,
                                  top: 0,
                                  right: 0,
                                  bottom: 300.h,
                                  child: GestureDetector(
                                    onTap: () {
                                      addFavoriteCubit.addFavorite(
                                          UserData.id, widget.productEntity.id);
                                    },
                                    child: isFavorite?Icon(
                                      MdiIcons.heart,
                                      color: Colors.red,
                                    ):Icon(
                                      MdiIcons.heartOutline,
                                    ),
                                  ),
                                );
                              },
                              loading: () {
                                return Positioned(
                                  left: 250.w,
                                  top: 0,
                                  right: 0,
                                  bottom: 300.h,
                                  child: GestureDetector(
                                    child: isFavorite?Icon(
                                      MdiIcons.heartOutline,
                                    ):Icon(
                                      MdiIcons.heart,
                                      color: Colors.red,
                                    ),
                                  ),
                                );
                              },
                              success: (state) {
                                return Positioned(
                                  left: 250.w,
                                  top: 0,
                                  right: 0,
                                  bottom: 300.h,
                                  child: GestureDetector(
                                    onTap: () {
                                      addFavoriteCubit.addFavorite(
                                          UserData.id, widget.productEntity.id);
                                    },
                                    child: state.status == 1 ? Icon(
                                      MdiIcons.heart,
                                      color: Colors.red,
                                    ) : Icon(
                                      MdiIcons.heartOutline,
                                    ),
                                  ),
                                );
                              },
                              error: (String errCode, String err) {
                                return StateErrorWidget(
                                  errCode: errCode.isNullOrEmpty(),
                                  err: err.isNullOrEmpty(),
                                );
                              },
                              orElse: () {
                                return const SizedBox.shrink();
                              },
                            ):const SizedBox.shrink(),
                            Positioned(
                              left: 0,
                              top: 0,
                              right: 250.w,
                              bottom: 300.h,
                              child: GestureDetector(
                                onTap: () {
                                  context.pop();
                                },
                                child: Icon(
                                  MdiIcons.arrowLeft,
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
                          Expanded(
                            child: Text(
                              CacheHelper.isEnglish()
                                  ? widget.productEntity.nameEn!
                                  : widget.productEntity.nameAr!,
                              style: CustomTextStyle.kTextStyleF20,
                            ),
                          ),
                          widget.productEntity.discountPercent==0?Text(
                            "${widget.productEntity.price} ${S.current.sar}",
                            style: CustomTextStyle.kTextStyleF18.copyWith(
                              color: AppColors.lightBlue,
                            ),
                          ):Text(
                            "${widget.productEntity.price} ${S.current.sar}",
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
                      Html(
                        data: CacheHelper.isEnglish()
                            ? widget.productEntity.descriptionEn!
                            : widget.productEntity.descriptionAr!,
                      ),
                      // Text(
                      //   S.current.product_des,
                      //   style: CustomTextStyle.kTextStyleF12.copyWith(
                      //     color: AppColors.black60,
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: context.queryWidth / 2),
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
                                      widget.productEntity.color!.length,
                                      (index) => Padding(
                                        padding:
                                            const EdgeInsets.all(Dimensions.p5),
                                        child: CircleAvatar(
                                          radius: Dimensions.r20,
                                          backgroundColor: Color(int.parse(
                                              '0xff${widget.productEntity.color![index].color}')),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: context.queryWidth / 2),
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
                                      widget.productEntity.size!.length,
                                      (index) => Padding(
                                        padding:
                                            const EdgeInsets.all(Dimensions.p5),
                                        child: CircleAvatar(
                                          radius: Dimensions.r20,
                                          backgroundColor: Colors.grey,
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
                                          style: CustomTextStyle.kTextStyleF14
                                              .copyWith(
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
                                          style: CustomTextStyle.kTextStyleF14
                                              .copyWith(
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
        },
      ),
    );
  }
}
