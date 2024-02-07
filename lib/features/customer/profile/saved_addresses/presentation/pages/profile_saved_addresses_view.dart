import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
import '../widgets/saved_address_item.dart';

class ProfileSavedAddressesView extends StatefulWidget {
  const ProfileSavedAddressesView({super.key,});

  @override
  State<ProfileSavedAddressesView> createState() => _ProfileSavedAddressesViewState();
}

class _ProfileSavedAddressesViewState extends State<ProfileSavedAddressesView> {
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
                                    padding: const EdgeInsets.only(
                                        bottom: Dimensions.p16),
                                    child: SavedAddressItem(
                                      address: state[index].address!,
                                      buildingNo: state[index].building!,
                                      flatNo: state[index].flat!,
                                      phone: state[index].phone!,
                                      country: state[index].country!,
                                      city: state[index].city!,
                                    ),
                                  );
                                },
                              ),
                              Gap(50.h),
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
