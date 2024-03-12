// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:intl/intl.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../core/shared/entities/products_images_entity.dart';
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../manager/add_favorite_cubit.dart';

class ImageStack extends StatefulWidget {
  final List<ProductsImagesEntity>? productImages;
  final String mainImg;
  final ProductEntity productEntity;
  int imgIndexCtrl;
  bool isFavorite;

  ImageStack({
    super.key,
    required this.productImages,
    required this.mainImg,
    required this.productEntity,
    required this.imgIndexCtrl,
    this.isFavorite = false,
  });

  @override
  State<ImageStack> createState() => _ImageStackState();
}

class _ImageStackState extends State<ImageStack> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          widget.productImages!.isEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.r25),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.imageUrl + widget.mainImg,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: AppColors.secondary,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )
              //
              : ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.r25),
                  child: GFCarousel(
                    viewportFraction: 1.0,
                    items: [
                      ...List.generate(
                        widget.productImages!.length,
                        (index) {
                          index = widget.imgIndexCtrl;
                          return Image.network(
                            AppConstants.imageUrl +
                                widget.productImages![index].image!,
                          );
                        },
                      ),
                    ],
                    scrollDirection: Axis.horizontal,
                    aspectRatio: 1,
                  ),
                ),
          BlocConsumer<AddFavoriteCubit, AddFavoriteStates>(
            listener: (context, state) {},
            builder: (context, state) {
              AddFavoriteCubit addFavoriteCubit = AddFavoriteCubit.get(context);
              return UserData.type == 'customer'
                  ? state.maybeWhen(
                      initial: () {
                        return Positioned(
                          left: Intl.getCurrentLocale() == "en" ? 250.w : 0,
                          top: 0,
                          right: Intl.getCurrentLocale() == "en" ? 0 : 250,
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
                        widget.isFavorite = state.status == 0 ? false : true;
                        return Positioned(
                          left: Intl.getCurrentLocale() == "en" ? 250.w : 0,
                          top: 0,
                          right: Intl.getCurrentLocale() == "en" ? 0 : 250,
                          bottom: 300.h,
                          child: GestureDetector(
                            onTap: () {
                              addFavoriteCubit.addFavorite(
                                  UserData.id, widget.productEntity.id);
                            },
                            child: widget.isFavorite
                                ? Icon(
                                    MdiIcons.heart,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    MdiIcons.heartOutline,
                                  ),
                          ),
                        );
                      },
                      loading: () {
                        return Positioned(
                          left: Intl.getCurrentLocale() == "en" ? 250.w : 0,
                          top: 0,
                          right: Intl.getCurrentLocale() == "en" ? 0 : 250,
                          bottom: 300.h,
                          child: GestureDetector(
                            child: widget.isFavorite
                                ? Icon(
                                    MdiIcons.heartOutline,
                                  )
                                : Icon(
                                    MdiIcons.heart,
                                    color: Colors.red,
                                  ),
                          ),
                        );
                      },
                      success: (state) {
                        return Positioned(
                          left: Intl.getCurrentLocale() == "en" ? 250.w : 0,
                          top: 0,
                          right: Intl.getCurrentLocale() == "en" ? 0 : 250,
                          bottom: 300.h,
                          child: GestureDetector(
                            onTap: () {
                              addFavoriteCubit.addFavorite(
                                  UserData.id, widget.productEntity.id);
                            },
                            child: state.status == 1
                                ? Icon(
                                    MdiIcons.heart,
                                    color: Colors.red,
                                  )
                                : Icon(
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
                    )
                  : const SizedBox.shrink();
            },
          ),
          Positioned(
            left: Intl.getCurrentLocale() == "en" ? 0 : 250,
            top: 0,
            right: Intl.getCurrentLocale() == "en" ? 250.w : 0,
            bottom: 300.h,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Icon(
                Intl.getCurrentLocale() == "en" ? MdiIcons.arrowLeft : MdiIcons.arrowRight,
              ),
            ),
          ),
          widget.productEntity.images!.isNotEmpty
              ? Positioned (
                  left: 0,
                  top: 133.h,
                  right: 250.w,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.p10),
                    child: Container(
                      height: 205.h,
                      width: 68.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(Dimensions.r18),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...List.generate(
                              widget.productEntity.images!.length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(Dimensions.p8),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.imgIndexCtrl = index;
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(Dimensions.r18),
                                      child: CachedNetworkImage(
                                        height: 55.h,
                                        width: 55.w,
                                        imageUrl: AppConstants.imageUrl +
                                            widget.productEntity.images![index]
                                                .image!,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color: AppColors.secondary,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
