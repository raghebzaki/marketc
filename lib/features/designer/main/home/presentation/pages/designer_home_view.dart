import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../domain/entities/designer_carousel_entity.dart';
import '../manager/designer_carousel_cubit.dart';

class DesignerHomeView extends StatefulWidget {
  const DesignerHomeView({super.key});

  @override
  State<DesignerHomeView> createState() => _DesignerHomeViewState();
}

class _DesignerHomeViewState extends State<DesignerHomeView> {
  ScrollController scrollController = ScrollController();

  var nextPage = 1;
  var isLoading = false;
  List<DesignerCarouselEntity> ads = [];

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<DesignerCarouselCubit>(context).getAds(
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(70.0.h), // here the desired height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Text(
                'محمود شاهين',
                style: CustomTextStyle.kTextStyleF20,
              ),
              Text(
                '+970 59 533 3781',
                textAlign: TextAlign.justify,
                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColorSecondary),
              )
            ],
          ),

          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Image.asset(AppImages.bellImg,width: 25.w,),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.p10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10.h),
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
                Gap(20.h),
                BlocConsumer<DesignerCarouselCubit, DesignerCarouselState>(
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64.w,
                              height: 64.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.increaseImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                                S.of(context).profit_ratio,
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                                '20%',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(10.w),
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64.w,
                              height: 64.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.saleHomeImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              S.of(context).purchases,
                              textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                              '120 عملية',
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              Gap(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 72.w,
                              height: 50.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.eyeImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                                S.of(context).number_of_buyers,
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                                '1,500,055',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(10.w),
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19A3A3A3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.moneyImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                                S.of(context).my_wallet,
                              textAlign: TextAlign.center,
                                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor)
                            ),
                            Text(
                              '\$ 25,001',
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.kTextStyleF10.copyWith(color: AppColors.textColorSecondary)
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
