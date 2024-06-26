import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/features/customer/main/category_details/presentation/manager/sub_category_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/helpers/cache_helper.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../domain/entities/category_details_entity.dart';
import '../manager/category_details_cubit.dart';

class CategoryDetailsView extends StatefulWidget {
  final num id;
  final String name;

  const CategoryDetailsView({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  ScrollController scrollController = ScrollController();

  num subCategory = 1;
  var nextPage = 1;
  var isLoading = false;
  List<ProductEntity> products = [];

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<CategoryDetailsCubit>(context).getProducts(
          CategoryDetailsEntity(
            categoryId: widget.id,
            filterId: subCategory,
            nextPage: ++nextPage,
          ),
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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<SubCategoryCubit>()..getAllSubCategory(),
        ),
      ],
      child: Scaffold(
        // backgroundColor: AppColors.primary,
        appBar: CustomAppBar(
          title: widget.name,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              Dimensions.p16,
            ),
            child: Column(
              children: [
                Gap(20.h),
                CustomSearchFormField(
                  label: S.current.you_think,
                  sufIcon: Icon(MdiIcons.magnify, size: 18.sp),
                ),
                BlocConsumer<SubCategoryCubit, SubCategoryState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () {
                        return const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
                      },
                      success: (state) {
                        return state!.isNotEmpty ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                state.length,
                                (index) {
                                  return BlocConsumer<CategoryDetailsCubit,
                                      CategoryDetailsStates>(
                                    listener: (context, state2) {},
                                    builder: (context, state2) {
                                      CategoryDetailsCubit
                                          categoryDetailsCubit =
                                          CategoryDetailsCubit.get(context);
                                      return GestureDetector(
                                        onTap: () {
                                          products.clear();
                                          nextPage = 1;
                                          subCategory = state[index].id!;
                                          categoryDetailsCubit.getProducts(
                                              CategoryDetailsEntity(
                                                  categoryId: widget.id,
                                                  filterId: subCategory,
                                                  nextPage: nextPage));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 35.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Dimensions.p16.w,
                                                vertical: Dimensions.p5.h),
                                            decoration: BoxDecoration(
                                              color: subCategory==state[index].id?AppColors.secondary:AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.r10),
                                            ),
                                            child: Text(
                                              CacheHelper.isEnglish()
                                                  ? state[index].nameEn!
                                                  : state[index].nameAr!,
                                              style: CustomTextStyle
                                                  .kTextStyleF14
                                                  .copyWith(
                                                color: subCategory==state[index].id?Colors.white:AppColors.secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ) : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "You have no favorites yet",
                                style:  CustomTextStyle.kTextStyleF20,
                              ),
                            ),
                          ],
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
                Gap(15.h),
                BlocConsumer<CategoryDetailsCubit, CategoryDetailsStates>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: (state) {
                        if (nextPage == 1) {
                          products = state.products!;
                        } else {
                          products.addAll(state.products!);
                        }
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
                        return products.isNotEmpty
                            ? Expanded(
                              child: AutoHeightGridView(
                                controller: scrollController,
                                itemCount: products.length,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.all(12),
                                  shrinkWrap: true,
                                  builder: (context, index) {
                                    return ProductCard(
                                        productEntity: products[index]);
                                  },
                                ),
                            )
                            : Text(S.of(context).no_products_yet);
                      },
                      paginationError: (errCode, err) {
                        return products.isNotEmpty
                            ? Expanded(
                              child: AutoHeightGridView(
                                controller: scrollController,
                                  itemCount: products.length,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.all(12),
                                  shrinkWrap: true,
                                  builder: (context, index) {
                                    return ProductCard(
                                        productEntity: products[index]);
                                  },
                                ),
                            )
                            : Text(S.of(context).no_products_yet);
                      },
                      paginationLoading: () {
                        return products.isNotEmpty
                            ? Expanded(
                              child: AutoHeightGridView(
                                                        controller: scrollController,
                              
                                                        itemCount: products.length,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.all(12),
                                  shrinkWrap: true,
                                  builder: (context, index) {
                                    return ProductCard(
                                        productEntity: products[index]);
                                  },
                                ),
                            )
                            : Text(S.of(context).no_products_yet);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
