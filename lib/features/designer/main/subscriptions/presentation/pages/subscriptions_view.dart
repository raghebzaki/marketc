import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../domain/entity/buy_subscription_entity.dart';
import '../../domain/entity/subscription_entity.dart';
import '../manager/buy_supscription_cubit/buy_supscription_cubit.dart';
import '../manager/subscriptions_cubit.dart';
import '../widgets/subscription_container.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<SubscriptionsCubit>()
            ..getPackages(
              const SubscriptionsEntity(nextPage: 1),
            ),
        ),
        BlocProvider(
          create: (context) => di.di<BuySubscriptionCubit>(),
        ),
      ],
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
                      child: SingleChildScrollView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      packages.length,
                                      (index) {
                                        return BlocConsumer<BuySubscriptionCubit,
                                            BuySubscriptionStates>(
                                          listener: (context, state) {
                                            BuySubscriptionCubit
                                            buySubscriptionCubit =
                                            BuySubscriptionCubit.get(context);
                                            state.maybeWhen(
                                              success: (state) {
                                                buySubscriptionCubit.paymentLauncher(state.paymentUrl!);
                                                context.defaultSnackBar(S.of(context).successfullySubscribed);
                                              },
                                              orElse: () {
                                                return null;
                                              },
                                            );
                                          },
                                          builder: (context, state) {
                                            BuySubscriptionCubit
                                                buySubscriptionCubit =
                                                BuySubscriptionCubit.get(context);
                                            return SubscriptionContainer(
                                              packageDataEntity: packages[index],
                                              onTap: () {
                                                buySubscriptionCubit
                                                    .buySubscriptions(
                                                  BuySubscriptionEntity(
                                                    userId: UserData.id,
                                                    packageId: packages[index].id,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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
                                      return BlocConsumer<BuySubscriptionCubit,
                                          BuySubscriptionStates>(
                                        listener: (context, state) {},
                                        builder: (context, state) {
                                          BuySubscriptionCubit
                                              buySubscriptionCubit =
                                              BuySubscriptionCubit.get(context);
                                          return SubscriptionContainer(
                                            packageDataEntity: packages[index],
                                            onTap: () {
                                              buySubscriptionCubit
                                                  .buySubscriptions(
                                                BuySubscriptionEntity(
                                                  userId: UserData.id,
                                                  packageId: packages[index].id,
                                                ),
                                              );
                                            },
                                          );
                                        },
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
                                      return BlocConsumer<BuySubscriptionCubit,
                                          BuySubscriptionStates>(
                                        listener: (context, state) {},
                                        builder: (context, state) {
                                          BuySubscriptionCubit
                                              buySubscriptionCubit =
                                              BuySubscriptionCubit.get(context);
                                          return SubscriptionContainer(
                                            packageDataEntity: packages[index],
                                            onTap: () {
                                              buySubscriptionCubit
                                                  .buySubscriptions(
                                                BuySubscriptionEntity(
                                                  userId: UserData.id,
                                                  packageId: packages[index].id,
                                                ),
                                              );
                                            },
                                          );
                                        },
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
