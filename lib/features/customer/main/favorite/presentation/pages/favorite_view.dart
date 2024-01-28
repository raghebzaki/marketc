import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/widgets/state_error_widget.dart';
import 'package:marketc/core/shared/widgets/state_loading_widget.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              return Scaffold(
                // backgroundColor: AppColors.primary,
                appBar: CustomAppBar(
                  title: S.of(context).favorite,
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.p16,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Gap(20.h),
                          CustomSearchFormField(
                            label: S.current.you_think,
                            sufIcon: Icon(MdiIcons.magnify, size: 18.sp),
                          ),
                          Gap(15.h),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 2.0,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 2 / 3,
                            children: [
                              ...List.generate(
                                state.length,
                                (index) {
                                  return ProductCard(
                                      productEntity: state[index].product!);
                                },
                              ),
                            ],
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
