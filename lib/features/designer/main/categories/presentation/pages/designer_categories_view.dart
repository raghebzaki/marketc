import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/entities/product_entity.dart';
import 'package:marketc/core/shared/models/user_data_model.dart';
import 'package:marketc/core/shared/widgets/product_card_designer.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/designer/main/categories/domain/entities/my_designer_products_entity.dart';
import 'package:marketc/features/designer/main/categories/presentation/manager/my_designer_products_cubit.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class DesignerCategoriesView extends StatefulWidget {
  const DesignerCategoriesView({super.key});

  @override
  State<DesignerCategoriesView> createState() => _DesignerCategoriesViewState();
}

class _DesignerCategoriesViewState extends State<DesignerCategoriesView> {
  ScrollController scrollController = ScrollController();

  var nextPage = 1;
  var isLoading = false;
  List<ProductEntity> products=[];
  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<MyDesignerProductsCubit>(context).getProducts(
          MyDesignerProductsEntity(userId: UserData.id),
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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyDesignerProductsCubit, MyDesignerProductsStates>(
      listener: (context, state) {
        state.maybeWhen(
          success: (state) {
            if(nextPage==1){
              products=state.products!;
            }else{
              products.addAll(state.products!);

            }
          },
          orElse: () {
            return null;
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: AppColors.primary,
          appBar: CustomAppBar(
            title: S.of(context).my_products,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(
                Dimensions.p16,
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Gap(10.h),
                    state.maybeWhen(
                      loading: () {
                        return const StateLoadingWidget();
                      },
                      success: (state) {
                        return AutoHeightGridView(
                          itemCount:  products.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(12),
                          shrinkWrap: true,
                          builder: (context, index) {
                            return  ProductCardDesigner(
                                 productEntity: products[index]
                            );
                          },
                        );
                      },
                      paginationLoading: () {
                        return AutoHeightGridView(
                          itemCount: products.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(12),
                          shrinkWrap: true,
                          builder: (context, index) {
                            return  ProductCardDesigner(
                                productEntity: products[index]
                            );
                          },
                        );
                      },
                      paginationError: (errCode, err) {
                        return AutoHeightGridView(
                          itemCount:  products.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(12),
                          shrinkWrap: true,
                          builder: (context, index) {
                            return  ProductCardDesigner(
                                productEntity: products[index]
                            );
                          },
                        );
                      },
                      error: (errCode, err) {
                        return StateErrorWidget(
                          errCode: errCode.isNullOrEmpty(),
                          err: err.isNullOrEmpty(),
                        );
                      },
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
