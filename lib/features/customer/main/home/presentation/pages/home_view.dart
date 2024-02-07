import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:marketc/core/helpers/cache_helper.dart';
import 'package:marketc/core/shared/arguments.dart';
import 'package:marketc/core/shared/widgets/state_loading_widget.dart';
import 'package:marketc/core/utils/app_constants.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/customer/main/home/domain/entities/carousel_entity.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/carousel_cubit.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/category_cubit.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/most_popular_cubit.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/new_products_cubit.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();

  var nextPage = 1;
  var isLoading = false;
  List<CarouselEntity> ads = [];

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<CarouselCubit>(context).getAds(
          ++nextPage,
        );
        isLoading = false;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        if (Platform.isAndroid) {
          SystemNavigator.pop();
          return ;
        } else if (Platform.isIOS) {
          exit(0);
        } else {
          return ;
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(context.queryWidth.w, 56.h),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.p8.w,
                    top: Dimensions.p8.h,
                    right: Dimensions.p8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: Dimensions.r21,
                    ),
                    Gap(10.w),
                    Expanded(
                      child: SizedBox(
                        height: 35.h,
                        child: CustomSearchFormField(
                          borderRadius: Dimensions.r8,
                          label: S.current.you_think,
                          sufIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                    Gap(10.w),
                    Image.asset(
                      AppImages.bellImg,
                      height: 20.h,
                      width: 20.w,
                    )
                  ],
                ),
              ),
            )),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.p10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.shopping_world,
                    style: CustomTextStyle.kTextStyleF20,
                  ),
                  Text(
                    S.current.slogan,
                    textAlign: TextAlign.right,
                    style: CustomTextStyle.kTextStyleF14
                        .copyWith(color: AppColors.textColor),
                  ),
                  Gap(10.h),
                  BlocConsumer<CarouselCubit, CarouselState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (state) {
                          ads.addAll(state!);
                        },
                        orElse: () {
                          return null;
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () {
                          return const StateLoadingWidget();
                        },
                        success: (state) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  ads.length,
                                  (index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Dimensions.p8),
                                      child: Container(
                                        width: 300.w,
                                        height: 150,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF8E7DE),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.r8)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    Dimensions.p5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      S.current.soon,
                                                      style: CustomTextStyle
                                                          .kTextStyleF8,
                                                    ),
                                                    Text(
                                                      ads[index].title!,
                                                      style: CustomTextStyle
                                                          .kTextStyleF16,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        ads[index].description!,
                                                        textAlign:
                                                            Intl.getCurrentLocale() ==
                                                                    "en"
                                                                ? TextAlign.left
                                                                : TextAlign.right,
                                                        style: CustomTextStyle
                                                            .kTextStyleF10,

                                                        // overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Intl.getCurrentLocale() ==
                                                                  "en"
                                                              ? Alignment
                                                                  .centerRight
                                                              : Alignment
                                                                  .centerLeft,
                                                      child: Container(
                                                        width: 82.w,
                                                        height: 18.h,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color:
                                                              AppColors.secondary,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          Dimensions
                                                                              .r4)),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            S.current.browse_now,
                                                            style: CustomTextStyle
                                                                .kTextStyleF8,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 140.w,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: ads[index].image ==
                                                          null
                                                      ? const CachedNetworkImageProvider(
                                                          "https://via.placeholder.com/140x140",
                                                        )
                                                      : CachedNetworkImageProvider(
                                                          AppConstants.fullImgUrl +
                                                              ads[index].image!,
                                                        ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        paginationLoading: () {
                          return SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  ads.length,
                                      (index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Dimensions.p8),
                                      child: Container(
                                        width: 300.w,
                                        height: 150,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF8E7DE),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.r8)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    Dimensions.p5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      S.current.soon,
                                                      style: CustomTextStyle
                                                          .kTextStyleF8,
                                                    ),
                                                    Text(
                                                      ads[index].title!,
                                                      style: CustomTextStyle
                                                          .kTextStyleF16,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        ads[index].description!,
                                                        textAlign:
                                                        Intl.getCurrentLocale() ==
                                                            "en"
                                                            ? TextAlign.left
                                                            : TextAlign.right,
                                                        style: CustomTextStyle
                                                            .kTextStyleF10,

                                                        // overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      Intl.getCurrentLocale() ==
                                                          "en"
                                                          ? Alignment
                                                          .centerRight
                                                          : Alignment
                                                          .centerLeft,
                                                      child: Container(
                                                        width: 82.w,
                                                        height: 18.h,
                                                        decoration:
                                                        ShapeDecoration(
                                                          color:
                                                          AppColors.secondary,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  Dimensions
                                                                      .r4)),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            S.current.browse_now,
                                                            style: CustomTextStyle
                                                                .kTextStyleF8,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 140.w,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: ads[index].image ==
                                                      null
                                                      ? const CachedNetworkImageProvider(
                                                    "https://via.placeholder.com/140x140",
                                                  )
                                                      : CachedNetworkImageProvider(
                                                    AppConstants.imageUrl +
                                                        ads[index].image!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        paginationError: (errCode, err) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  ads.length,
                                      (index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Dimensions.p8),
                                      child: Container(
                                        width: 300.w,
                                        height: 150,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF8E7DE),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.r8)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    Dimensions.p5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      S.current.soon,
                                                      style: CustomTextStyle
                                                          .kTextStyleF8,
                                                    ),
                                                    Text(
                                                      ads[index].title!,
                                                      style: CustomTextStyle
                                                          .kTextStyleF16,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        ads[index].description!,
                                                        textAlign:
                                                        Intl.getCurrentLocale() ==
                                                            "en"
                                                            ? TextAlign.left
                                                            : TextAlign.right,
                                                        style: CustomTextStyle
                                                            .kTextStyleF10,

                                                        // overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      Intl.getCurrentLocale() ==
                                                          "en"
                                                          ? Alignment
                                                          .centerRight
                                                          : Alignment
                                                          .centerLeft,
                                                      child: Container(
                                                        width: 82.w,
                                                        height: 18.h,
                                                        decoration:
                                                        ShapeDecoration(
                                                          color:
                                                          AppColors.secondary,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  Dimensions
                                                                      .r4)),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            S.current.browse_now,
                                                            style: CustomTextStyle
                                                                .kTextStyleF8,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 140.w,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: ads[index].image ==
                                                      null
                                                      ? const CachedNetworkImageProvider(
                                                    "https://via.placeholder.com/140x140",
                                                  )
                                                      : CachedNetworkImageProvider(
                                                    AppConstants.imageUrl +
                                                        ads[index].image!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
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
                  Gap(10.h),
                  Text(
                    S.current.categories,
                    textAlign: TextAlign.right,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                  BlocConsumer<CategoryCubit, CategoryState>(
                    listener: (context, state) {},
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
                                    return GestureDetector(
                                      onTap: () {
                                        context.pushNamed(
                                          categoryDetailsPageRoute,
                                          arguments: CategoryDetailsArgs(
                                            id: 1,
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.p8.w),
                                        child: Container(
                                          width: 85.w,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
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
                                                Image.network(
                                                  AppConstants.imageUrl +
                                                      state[index].image!,
                                                  width: 48.w,
                                                  height: 48.w,
                                                ),
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
                          return const Center(child: CircularProgressIndicator());
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
                  Gap(10.h),
                  Row(
                    children: [
                      Text(
                        S.current.popular,
                        textAlign: TextAlign.right,
                        style: CustomTextStyle.kTextStyleF16,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(mostPopularSeeMorePageRoute);
                        },
                        child: Text(
                          S.current.more,
                          textAlign: TextAlign.right,
                          style: CustomTextStyle.kTextStyleF14
                              .copyWith(color: AppColors.lightBlue),
                        ),
                      ),
                      Gap(10.w),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 24.sp,
                      ),
                    ],
                  ),
                  BlocConsumer<MostPopularCubit, MostPopularState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.maybeWhen(success: (state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                state!.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(Dimensions.p8),
                                    child: ProductCard(
                                      productEntity: state[index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }, loading: () {
                        return const Center(child: CircularProgressIndicator());
                      }, error: (errCode, err) {
                        return StateErrorWidget(
                          errCode: errCode!,
                          err: err!,
                        );
                      }, orElse: () {
                        return const SizedBox.shrink();
                      });
                    },
                  ),
                  Gap(10.h),
                  Row(
                    children: [
                      Text(
                        S.current.new_releases,
                        textAlign: TextAlign.right,
                        style: CustomTextStyle.kTextStyleF16,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(newProductsSeeMorePageRoute);
                        },
                        child: Text(
                          S.current.more,
                          textAlign: TextAlign.right,
                          style: CustomTextStyle.kTextStyleF14
                              .copyWith(color: AppColors.lightBlue),
                        ),
                      ),
                      Gap(10.w),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 24.sp,
                      ),
                    ],
                  ),
                  BlocConsumer<NewProductsCubit, NewProductsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.maybeWhen(success: (state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                state!.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(Dimensions.p8),
                                    child: ProductCard(
                                      productEntity: state[index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }, loading: () {
                        return const Center(child: CircularProgressIndicator());
                      }, error: (errCode, err) {
                        return StateErrorWidget(
                          errCode: errCode!,
                          err: err!,
                        );
                      }, orElse: () {
                        return const SizedBox.shrink();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
