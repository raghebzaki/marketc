import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/dependency_injection/di.dart' as di;
import 'package:marketc/core/shared/models/user_data_model.dart';
import 'package:marketc/core/shared/widgets/product_card_designer.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/designer/main/categories/domain/entities/my_designer_products_entity.dart';
import 'package:marketc/features/designer/main/categories/presentation/manager/my_designer_products_cubit.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class DesignerCategoriesView extends StatefulWidget {
  const DesignerCategoriesView({super.key});

  @override
  State<DesignerCategoriesView> createState() => _DesignerCategoriesViewState();
}

class _DesignerCategoriesViewState extends State<DesignerCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<MyDesignerProductsCubit>()..getProducts(MyDesignerProductsEntity(userId: UserData.id), 1),
      child: BlocConsumer<MyDesignerProductsCubit, MyDesignerProductsStates>(
        listener: (context, state) {},
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
                  child: Column(
                    children: [
                      Gap(20.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.r10),
                              ),
                              child: Text(
                                S.of(context).all,
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Gap(10.h),
                            Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.r10),
                              ),
                              child: Text(
                                S.current.short_cloths,
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Gap(10.h),
                            Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.r10),
                              ),
                              child: Text(
                                S.current.short_cloths,
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Gap(10.h),
                            Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.r10),
                              ),
                              child: Text(
                                S.current.short_cloths,
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15.h),
                      state.maybeWhen(
                        loading: () {
                          return const StateLoadingWidget();
                        },
                        success: (state) {
                          return AutoHeightGridView(
                            itemCount:  state.products!.length,
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 10,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(12),
                            shrinkWrap: true,
                            builder: (context, index) {
                              return  ProductCardDesigner(
                                   productEntity: state.products![index]
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
      ),
    );
  }
}
