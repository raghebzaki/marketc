import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/features/customer/orders/track_order/presentation/manager/track_order_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/entities/order_entity.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../domain/entities/cancel_order_entity.dart';

class TrackOrderView extends StatefulWidget {
  final OrderEntity orderDetails;

  const TrackOrderView({super.key, required this.orderDetails, });

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  var time = TimeOfDay.now();
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => di.di<TrackOrderCubit>(),
    ),
  ],
  child: BlocConsumer<TrackOrderCubit, TrackOrderStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              context.pushNamed(myOrdersPageRoute);
            },
            orElse: () {
              return null;
            },
          );
        },
        builder: (context, state) {
          TrackOrderCubit trackOrderCubit = TrackOrderCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: CustomAppBar(
                title:
                    "${S.of(context).order_no} ${widget.orderDetails.orderNumber}"),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                  Dimensions.p16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaxGap(35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).est,
                              style: CustomTextStyle.kTextStyleF12
                                  .copyWith(color: AppColors.textColorGrey),
                            ),
                            Text(
                              "",
                              style: CustomTextStyle.kTextStyleF16,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (ctx) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Dimensions.p16,
                                        vertical: Dimensions.p25),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).cancel_alert,
                                          style: CustomTextStyle.kTextStyleF16,
                                        ),
                                        Gap(24.h),
                                        GestureDetector(
                                          onTap: () {
                                            trackOrderCubit.cancelOrder(
                                              const CancelOrderEntity(
                                                orderId: 1,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                Dimensions.p20),
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.statusRedContainer,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.r10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                S.of(context).cancel_yes,
                                                style: CustomTextStyle
                                                    .kTextStyleF16
                                                    .copyWith(
                                                  color: AppColors.statusRed,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Gap(10.h),
                                        GestureDetector(
                                          onTap: () {
                                            context.pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                Dimensions.p20),
                                            decoration: BoxDecoration(
                                              // color: AppColors.statusRedContainer,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.r10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                S.of(context).close,
                                                style: CustomTextStyle
                                                    .kTextStyleF16
                                                    .copyWith(
                                                  color:
                                                      AppColors.textColorGrey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            S.of(context).cancel_order,
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: AppColors.errorColor,
                            ),
                          ),
                        ),
                        // StatusIndicator(
                        //   statusText: "تم التوصيل",
                        //   textColor: AppColors.statusGreen,
                        //   containerColor: AppColors.statusGreenContainer,
                        // )
                      ],
                    ),
                    Gap(25.h),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.p16, vertical: Dimensions.p25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.r15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).track_order,
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              Text(
                                "${widget.orderDetails.orderNumber}",
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: AppColors.textColorGrey,
                                ),
                              ),
                            ],
                          ),
                          Gap(25.h),
                          const Divider(thickness: 2.0),
                          Gap(25.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.p16.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.r15,
                                  backgroundColor:
                                           AppColors.secondary,
                                  child: Icon(MdiIcons.check),
                                ),
                                Gap(20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(S.of(context).order_confirmed),
                                    Text(
                                        "${date.stringFormat(DateFormatType.dayMonthYear)}, ${time.stringFormat(
                                      formatType:
                                          TimeFormatType.hoursMinutesPeriod,
                                    )}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gap(55.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.p16.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.r15,
                                  backgroundColor: AppColors.secondary,
                                  child: Icon(MdiIcons.check),
                                ),
                                Gap(20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(S.of(context).prepare_order),
                                    Text(
                                        "${date.stringFormat(DateFormatType.dayMonthYear)}, ${time.stringFormat(
                                      formatType:
                                          TimeFormatType.hoursMinutesPeriod,
                                    )}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gap(55.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.p16.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.r15,
                                  backgroundColor: AppColors.secondary,
                                  child: Icon(MdiIcons.check),
                                ),
                                Gap(20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(S.of(context).prepare_order),
                                    Text(
                                        "${date.stringFormat(DateFormatType.dayMonthYear)}, ${time.stringFormat(
                                      formatType:
                                          TimeFormatType.hoursMinutesPeriod,
                                    )}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gap(55.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.p16.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.r15,
                                  backgroundColor: AppColors.secondary,
                                  child: Icon(MdiIcons.check),
                                ),
                                Gap(20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(S.of(context).prepare_order),
                                    Text(
                                        "${date.stringFormat(DateFormatType.dayMonthYear)}, ${time.stringFormat(
                                      formatType:
                                          TimeFormatType.hoursMinutesPeriod,
                                    )}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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
