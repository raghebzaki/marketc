import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/widgets/state_error_widget.dart';
import 'package:marketc/core/shared/widgets/state_loading_widget.dart';
import 'package:marketc/features/customer/orders/my_orders/presentation/manager/my_orders_cubit.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/entities/order_entity.dart';
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../widgets/order_container.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  int status = 0;
List<String> statusList = [
  S.current.pending,
  S.current.processing,
  S.current.shipped_status,
  S.current.done_status,
  S.current.cancelled_status,
];
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<MyOrdersCubit>()
        ..getMyOrders(
          OrderEntity(
            userId: UserData.id,
            orderFilter: status,
          ),
        ),
      child: BlocConsumer<MyOrdersCubit, MyOrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MyOrdersCubit ordersCubit = MyOrdersCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: CustomAppBar(
              title: S.of(context).my_orders,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                  Dimensions.p16,
                ),
                child: Column(
                  children: [
                    Gap(20.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                status = 0;
                              });
                              ordersCubit.getMyOrders(
                                OrderEntity(
                                  userId: UserData.id,
                                  orderFilter: status,
                                ),
                              );
                            },
                            child: Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: status == 0
                                    ? AppColors.secondary
                                    : AppColors.primary,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.r10),
                                border: Border.all(
                                  color: AppColors.secondary,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).pending,
                                  style:
                                      CustomTextStyle.kTextStyleF14.copyWith(
                                    color: status == 0
                                        ? AppColors.primary
                                        : AppColors.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                status = 1;
                              });
                              ordersCubit.getMyOrders(
                                OrderEntity(
                                  userId: UserData.id,
                                  orderFilter: status,
                                ),
                              );
                            },
                            child: Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: status == 1
                                    ? AppColors.secondary
                                    : AppColors.primary,
                                borderRadius:
                                BorderRadius.circular(Dimensions.r10),
                                border: Border.all(
                                  color: AppColors.secondary,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  S.current.processing,
                                  style:
                                  CustomTextStyle.kTextStyleF14.copyWith(
                                    color: status == 1
                                        ? AppColors.primary
                                        : AppColors.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                status = 2;
                              });
                              ordersCubit.getMyOrders(
                                OrderEntity(
                                  userId: UserData.id,
                                  orderFilter: status,
                                ),
                              );
                            },
                            child: Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: status == 2
                                    ? AppColors.secondary
                                    : AppColors.primary,
                                borderRadius:
                                BorderRadius.circular(Dimensions.r10),
                                border: Border.all(
                                  color: AppColors.secondary,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).shipped,
                                  style:
                                  CustomTextStyle.kTextStyleF14.copyWith(
                                    color: status == 2
                                        ? AppColors.primary
                                        : AppColors.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                status = 3;
                              });
                              ordersCubit.getMyOrders(
                                OrderEntity(
                                  userId: UserData.id,
                                  orderFilter: status,
                                ),
                              );
                            },
                            child: Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: status == 3
                                    ? AppColors.secondary
                                    : AppColors.primary,
                                borderRadius:
                                BorderRadius.circular(Dimensions.r10),
                                border: Border.all(
                                  color: AppColors.secondary,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  S.current.done,
                                  style:
                                  CustomTextStyle.kTextStyleF14.copyWith(
                                    color: status == 3
                                        ? AppColors.primary
                                        : AppColors.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                status = 4;
                              });
                              ordersCubit.getMyOrders(
                                OrderEntity(
                                  userId: UserData.id,
                                  orderFilter: status,
                                ),
                              );
                            },
                            child: Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16.w,
                                  vertical: Dimensions.p5.h),
                              decoration: BoxDecoration(
                                color: status == 4
                                    ? AppColors.secondary
                                    : AppColors.primary,
                                borderRadius:
                                BorderRadius.circular(Dimensions.r10),
                                border: Border.all(
                                  color: AppColors.secondary,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  S.current.cancelled,
                                  style:
                                  CustomTextStyle.kTextStyleF14.copyWith(
                                    color: status == 4
                                        ? AppColors.primary
                                        : AppColors.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    state.maybeWhen(
                      loading: () {
                        return const StateLoadingWidget();
                      },
                      success: (state) {
                        return state.isNotEmpty ? Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                           physics: const BouncingScrollPhysics(),
                            itemCount: state.length,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: Dimensions.p8),
                                child: OrderContainer(
                                    orderEntity: state[index],
                                    ));
                            },
                          ),
                        ) : Expanded(
                          child: Center(
                            child: Text(S.current.youHaveNo+statusList[status]+S.current.orders, style: CustomTextStyle.kTextStyleF18,
                            textAlign: TextAlign.center,),),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
