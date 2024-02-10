import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/shared/widgets/state_error_widget.dart';
import 'package:marketc/core/shared/widgets/state_loading_widget.dart';
import 'package:marketc/core/utils/dimensions.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/designer/main/subscriptions/domain/entity/subscription_entity.dart';
import 'package:marketc/features/designer/main/subscriptions/presentation/widgets/subscription_container.dart';

import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/router/router.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/subscriptions_cubit.dart';

class SubscriptionsView extends StatefulWidget {
  const SubscriptionsView({super.key});

  @override
  State<SubscriptionsView> createState() => _SubscriptionsViewState();
}

class _SubscriptionsViewState extends State<SubscriptionsView> {
  ScrollController scrollController = ScrollController();

  num subCategory = 1;
  var nextPage = 1;
  var isLoading = false;
  List<PackageDataEntity> packages = [];

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SubscriptionsCubit>(context).getPackages(
          SubscriptionsEntity(
            nextPage: ++nextPage,
          ),
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<SubscriptionsCubit>()
        ..getPackages(
          const SubscriptionsEntity(nextPage: 1),
        ),
      child: BlocConsumer<SubscriptionsCubit, SubscriptionsStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              packages.addAll(state);
            },
            orElse: () {
              return null;
            },
          );
        },
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) async {
              if (didPop) return;
              context.pushNamed(designerBottomNavBarPageRoute);
            },
            child: Scaffold(
              backgroundColor: AppColors.primary,
              appBar: CustomAppBar(
                title: S.of(context).subscriptions,
              ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(30.h),
                          Text(
                            S.of(context).subscriptions_title,
                            style: CustomTextStyle.kTextStyleF20,
                          ),
                          Gap(10.h),
                          Text(
                            S.of(context).subscriptions_des,
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(60.h),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.p10),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ...List.generate(
                                    packages.length,
                                        (index) {
                                      return SubscriptionContainer(
                                        packageName:
                                        packages[index].packageName!,
                                        packagePrice:
                                        packages[index].packagePrice!,
                                        packageBenefits:
                                        packages[index].packageBenefits!,
                                        packageDiscountPrice: packages[index]
                                            .packageDiscountPrice!,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  paginationLoading: () {
                    return Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.p16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(30.h),
                          Text(
                            S.of(context).subscriptions_title,
                            style: CustomTextStyle.kTextStyleF20,
                          ),
                          Gap(10.h),
                          Text(
                            S.of(context).subscriptions_des,
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(60.h),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.p10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: packages.length,
                                    itemBuilder: (ctx, index) {
                                      return SubscriptionContainer(
                                        packageName:
                                            packages[index].packageName!,
                                        packagePrice:
                                            packages[index].packagePrice!,
                                        packageBenefits:
                                            packages[index].packageBenefits!,
                                        packageDiscountPrice: packages[index]
                                            .packageDiscountPrice!,
                                      );
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  paginationError: (errCode, err) {
                    return Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.p16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(30.h),
                          Text(
                            S.of(context).subscriptions_title,
                            style: CustomTextStyle.kTextStyleF20,
                          ),
                          Gap(10.h),
                          Text(
                            S.of(context).subscriptions_des,
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(60.h),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.p10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: packages.length,
                                    itemBuilder: (ctx, index) {
                                      return SubscriptionContainer(
                                        packageName:
                                            packages[index].packageName!,
                                        packagePrice:
                                            packages[index].packagePrice!,
                                        packageBenefits:
                                            packages[index].packageBenefits!,
                                        packageDiscountPrice: packages[index]
                                            .packageDiscountPrice!,
                                      );
                                    })
                              ],
                            ),
                          )
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
