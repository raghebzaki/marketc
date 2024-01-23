import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/database/database_hive.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/saved_addresses_cubit.dart';

class SavedAddressesView extends StatefulWidget {
  const SavedAddressesView({super.key});

  @override
  State<SavedAddressesView> createState() => _SavedAddressesViewState();
}

class _SavedAddressesViewState extends State<SavedAddressesView> {
  final HiveDatabase hiveDatabase = HiveDatabase();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SavedAddressesCubit(hiveDatabase: hiveDatabase)..getAddresses(),
      child: BlocConsumer<SavedAddressesCubit, SavedAddressesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: CustomAppBar(title: S.of(context).saved_addresses),
            body: SafeArea(
              child: state.maybeWhen(
                loading: () {
                  return const StateLoadingWidget();
                },
                success: (state) {
                  return Padding(
                    padding: const EdgeInsets.all(Dimensions.p16),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(35.h),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: Dimensions.p16),
                                    child: Container(
                                      padding: const EdgeInsets.all(Dimensions.p16),
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Address: ", style: CustomTextStyle.kTextStyleF16.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              Expanded(
                                                child: Text(
                                                  state[index].address.isNullOrEmpty(),
                                                  style: CustomTextStyle.kTextStyleF16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Building N0.: ", style: CustomTextStyle.kTextStyleF16.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              Expanded(
                                                child: Text(
                                                  state[index].building.isNullOrEmpty(),
                                                  style: CustomTextStyle.kTextStyleF16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Flat N0.: ", style: CustomTextStyle.kTextStyleF16.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              Expanded(
                                                child: Text(
                                                  state[index].flat.isNullOrEmpty(),
                                                  style: CustomTextStyle.kTextStyleF16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Phone: ", style: CustomTextStyle.kTextStyleF16.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              Expanded(
                                                child: Text(
                                                  state[index].phone.isNullOrEmpty(),
                                                  style: CustomTextStyle.kTextStyleF16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("State: ", style: CustomTextStyle.kTextStyleF16.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              Expanded(
                                                child: Text(
                                                  state[index].state.isNullOrEmpty(),
                                                  style: CustomTextStyle.kTextStyleF16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("City: ", style: CustomTextStyle.kTextStyleF16.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              Expanded(
                                                child: Text(
                                                  state[index].city.isNullOrEmpty(),
                                                  style: CustomTextStyle.kTextStyleF16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.white,
                            child: CustomBtn(
                              label: S.of(context).add_new_address,
                              onPressed: () async {
                                context.pushNamed(mapPageRoute);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                error: (err) {
                  return StateErrorWidget(
                    errCode: AppConstants.unknownNumValue.toString(),
                    err: err,
                  );
                },
                orElse: () {
                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
