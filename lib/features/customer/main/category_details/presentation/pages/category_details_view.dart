import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/features/customer/main/category_details/presentation/manager/sub_category_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/helpers/cache_helper.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../domain/entities/category_details_entity.dart';
import '../manager/category_details_cubit.dart';

class CategoryDetailsView extends StatefulWidget {
  final num id;

  const CategoryDetailsView({
    super.key,
    required this.id,
  });

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  CategoryDetailsEntity categoryDetailsEntity = const CategoryDetailsEntity();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.di<CategoryDetailsCubit>()..getProducts(categoryDetailsEntity),
        ),
        BlocProvider(
          create: (context) => di.di<SubCategoryCubit>()..getAllSubCategory(),
        ),
      ],
      child: Scaffold(
        // backgroundColor: AppColors.primary,
        appBar: CustomAppBar(
          title: S.of(context).short_cloth_category,
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
                        return const CircularProgressIndicator();
                      },
                      success: (state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                state!.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Container(
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
                                        CacheHelper.isEnglish()?state[index].nameEn!:state[index].nameAr!,
                                        style: CustomTextStyle.kTextStyleF14
                                            .copyWith(
                                          color: Colors.white,
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
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () {
                        return const StateLoadingWidget();
                      },
                      success: (state) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
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
                                    10,
                                    (index) {
                                      return const SizedBox();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
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
