import 'package:flutter/material.dart';
import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/new_products_cubit.dart';

class NewProductsSeeMoreView extends StatefulWidget {
  const NewProductsSeeMoreView({super.key});

  @override
  State<NewProductsSeeMoreView> createState() => _NewProductsSeeMoreViewState();
}

class _NewProductsSeeMoreViewState extends State<NewProductsSeeMoreView> {
  ScrollController scrollController = ScrollController();
  int nextPage = 1;
  bool isLoading = false;

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewProductsCubit>(context)
            .getAllProducts(nextPage);
        isLoading = false;
      }
    }
  }

  List<ProductEntity> newProducts = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewProductsCubit, NewProductsState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (state) {
            newProducts.addAll(state!);
          },
          orElse: () {
            return null;
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: S.current.new_releases),
          body: SafeArea(
            child: state.maybeWhen(
              loading: () {
                return const StateLoadingWidget();
              },
              success: (state) {
                return Padding(
                  padding: const EdgeInsets.all(
                    Dimensions.p16,
                  ),
                  child: AutoHeightGridView(
                    controller: scrollController,
                    itemCount: newProducts.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    shrinkWrap: true,
                    builder: (context, index) {
                      return ProductCard(
                        productEntity: newProducts[index],
                      );
                    },
                  ),
                );
              },
              paginationLoading: () {
                return Padding(
                  padding: const EdgeInsets.all(
                    Dimensions.p16,
                  ),
                  child: AutoHeightGridView(
                    controller: scrollController,
                    itemCount: newProducts.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    shrinkWrap: true,
                    builder: (context, index) {
                      return ProductCard(
                        productEntity: newProducts[index],
                      );
                    },
                  ),
                );
              },
              paginationError: (errCode, err) {
                return Padding(
                  padding: const EdgeInsets.all(
                    Dimensions.p16,
                  ),
                  child: AutoHeightGridView(
                    controller: scrollController,
                    itemCount: newProducts.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    shrinkWrap: true,
                    builder: (context, index) {
                      return ProductCard(
                        productEntity: newProducts[index],
                      );
                    },
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
            ),
          ),
        );
      },
    );
  }
}
