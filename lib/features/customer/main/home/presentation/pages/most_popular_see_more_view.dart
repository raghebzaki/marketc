import 'package:flutter/material.dart';
import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/most_popular_cubit.dart';

class MostPopularSeeMoreView extends StatefulWidget {
  const MostPopularSeeMoreView({super.key});

  @override
  State<MostPopularSeeMoreView> createState() => _MostPopularSeeMoreViewState();
}

class _MostPopularSeeMoreViewState extends State<MostPopularSeeMoreView> {
  ScrollController scrollController = ScrollController();
  int nextPage = 1;
  bool isLoading = false;

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<MostPopularCubit>(context)
            .getAllProducts(nextPage);
        isLoading = false;
      }
    }
  }

  List<ProductEntity> mostPopularProducts = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MostPopularCubit, MostPopularState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (state) {
            mostPopularProducts.addAll(state!);
          },
          orElse: () {
            return null;
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: S.of(context).popular),
          body: SafeArea(
            child: state.maybeWhen(
              loading: () {
                return const StateLoadingWidget();
              },
              success: (state) {
                return AutoHeightGridView(
                  controller: scrollController,
                  itemCount: mostPopularProducts.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  builder: (context, index) {
                    return ProductCard(
                      productEntity: mostPopularProducts[index],
                    );
                  },
                ).paddingAll(Dimensions.p16,);
              },
              paginationLoading: () {
                return AutoHeightGridView(
                  controller: scrollController,
                  itemCount: mostPopularProducts.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  builder: (context, index) {
                    return ProductCard(
                      productEntity: mostPopularProducts[index],
                    );
                  },
                ).paddingAll(Dimensions.p16,);
              },
              paginationError: (errCode, err) {
                return AutoHeightGridView(
                  controller: scrollController,
                  itemCount: mostPopularProducts.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  builder: (context, index) {
                    return ProductCard(
                      productEntity: mostPopularProducts[index],
                    );
                  },
                ).paddingAll(Dimensions.p16,);
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
