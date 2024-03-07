import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/widgets/state_error_widget.dart';
import 'package:marketc/core/shared/widgets/state_loading_widget.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/designer/profile/user_balance/domain/entities/user_balance_entity.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/get_balance/get_balance_cubit.dart';
import '../manager/withdraw_balance/withdraw_balance_cubit.dart';
import '../widgets/points_row_widget.dart';

class UserBalanceView extends StatelessWidget {
  const UserBalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<GetBalanceCubit>()
            ..getUserBalance(
              UserBalanceEntity(
                userId: UserData.id,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => di.di<WithdrawBalanceCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: CustomAppBar(
          title: S.current.user_profile,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${UserData.currentBalance ?? 0}",
                        style: CustomTextStyle.kTextStyleF20
                            .copyWith(color: AppColors.black80),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).can_send_money,
                        style: CustomTextStyle.kTextStyleF12
                            .copyWith(color: AppColors.textColorGrey),
                      ),
                      Gap(30.h),
                      BlocConsumer<WithdrawBalanceCubit, WithdrawBalanceStates>(
                        listener: (context, state) {
                          state.maybeWhen(
                            withdrawalSuccess: (state) {
                              context.defaultSnackBar(
                                  S.of(context).amountWithdrewSuccessfully);
                            },
                            orElse: () {
                              return null;
                            },
                          );
                        },
                        builder: (context, state) {
                          WithdrawBalanceCubit withdrawBalanceCubit =
                              WithdrawBalanceCubit.get(context);
                          return SizedBox(
                            width: 280.w,
                            child: ConditionalBuilder(
                                condition: state is! WithdrawalLoading,
                                builder: (ctx) {
                                  return CustomBtn(
                                    label: S.of(context).send_money,
                                    onPressed: () {
                                      if (UserData.currentBalance == 0 ||
                                          UserData.currentBalance == null) {
                                        context.defaultSnackBar(
                                            S.of(context).youCantWithdraw0Amount);
                                      } else {
                                        withdrawBalanceCubit
                                            .withdrawUserBalance(
                                          UserBalanceEntity(
                                            userId: UserData.id,
                                            amount: UserData.currentBalance,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                                fallback: (ctx) {
                                  return const Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  );
                                }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text(
                    S.of(context).use_points,
                    style: CustomTextStyle.kTextStyleF16
                        .copyWith(color: AppColors.textColorSecondary),
                  ),
                ),
                Gap(10.h),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: AppColors.borderColor),
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).code,
                        style: CustomTextStyle.kTextStyleF14
                            .copyWith(color: AppColors.textColorGrey),
                      ),
                      Text(
                        S.of(context).amount,
                        style: CustomTextStyle.kTextStyleF14
                            .copyWith(color: AppColors.textColorGrey),
                      ),
                      Text(
                        S.of(context).date,
                        style: CustomTextStyle.kTextStyleF14
                            .copyWith(color: AppColors.textColorGrey),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<GetBalanceCubit, GetBalanceStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state.maybeWhen(
                      getBalanceLoading: () {
                        return const StateLoadingWidget();
                      },
                      getBalanceSuccess: (state) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                state.length,
                                (index) => Container(
                                  width: double.infinity,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 10.w),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.borderColor),
                                    ),
                                  ),
                                  child: PointsRowWidget(
                                      balanceEntity: state[index]),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      getBalanceError: (errCode, err) {
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
