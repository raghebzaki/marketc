import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/widgets/state_error_widget.dart';
import 'package:marketc/core/shared/widgets/state_loading_widget.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.di<FavoriteCubit>()..getAllProducts(UserData.id!, 1),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return const StateLoadingWidget();
            },
            success: (state) {
              return PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) async {
                  if (didPop) return;
                  context.pushNamed(bottomNavBarPageRoute);
                },
                child: Scaffold(
                  // backgroundColor: AppColors.primary,
                  appBar: CustomAppBar(
                    title: S.of(context).favorite,
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.p16,
                      ),
                      child: state.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  Gap(20.h),
                                  CustomSearchFormField(
                                    label: S.current.you_think,
                                    sufIcon:
                                        Icon(MdiIcons.magnify, size: 18.sp),
                                  ),
                                  Gap(15.h),
                                  AutoHeightGridView(
                                    itemCount: state.length,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(12),
                                    shrinkWrap: true,
                                    builder: (context, index) {
                                      return ProductCard(
                                          productEntity: state[index].product!);
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    S.of(context).youHaveNoFavoritesYet,
                                    style:  CustomTextStyle.kTextStyleF20,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
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
          );
        },
      ),
    );
  }
}
