import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../config/themes/app_text_styles.dart';
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
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.p16.w,
                            vertical: Dimensions.p5.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).done,
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(10.h),
                    Expanded(
                      child: Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.p16.w,
                            vertical: Dimensions.p5.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).processing,
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(10.h),
                    Expanded(
                      child: Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.p16.w,
                            vertical: Dimensions.p5.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(Dimensions.r10),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).cancelled,
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Dimensions.p8),
                      child: OrderContainer(
                        orderNo: "234347",
                        total: "189.00",
                        qty: "2",
                        date: date,
                      ),
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
