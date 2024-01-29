import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/helpers/cache_helper.dart';
import 'package:marketc/core/shared/arguments.dart';
import 'package:marketc/core/utils/app_constants.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/carousel_cubit.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/category_cubit.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/most_popular_cubit.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/new_products_cubit.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<CategoryCubit>()..getAllCategory(),
        ),
        BlocProvider(
          create: (context) => di.di<CarouselCubit>(),
        ),
        BlocProvider(
          create: (context) => di.di<MostPopularCubit>()..getAllProducts(1),
        ),
        BlocProvider(
          create: (context) => di.di<NewProductsCubit>()..getAllProducts(1),
        ),
      ],
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
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
                                      borderRadius:
                                          BorderRadius.circular(Dimensions.r8)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(Dimensions.p5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              S.current.soon,
                                              style:
                                                  CustomTextStyle.kTextStyleF8,
                                            ),
                                            Text(
                                              S.current.custom_logo,
                                              style:
                                                  CustomTextStyle.kTextStyleF16,
                                            ),
                                            Text(
                                              S.current.wide_range,
                                              textAlign: TextAlign.right,
                                              style:
                                                  CustomTextStyle.kTextStyleF10,
                                            ),
                                            Container(
                                              width: 82.w,
                                              height: 18.h,
                                              decoration: ShapeDecoration(
                                                color: AppColors.secondary,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions.r4)),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  S.current.browse_now,
                                                  style: CustomTextStyle
                                                      .kTextStyleF8,
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
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://via.placeholder.com/140x140"),
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
                                    padding:
                                        const EdgeInsets.all(Dimensions.p8),
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
                                    padding:
                                        const EdgeInsets.all(Dimensions.p8),
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
