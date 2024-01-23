import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/database/address_class.dart';
import '../../../../../../core/database/database_hive.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/add_address_cubit.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  final Address address = Address();
  final HiveDatabase hiveDatabase = HiveDatabase();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAddressCubit(hiveDatabase: hiveDatabase),
      child: BlocConsumer<AddAddressCubit, AddAddressStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AddAddressCubit addAddressCubit = AddAddressCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: CustomAppBar(title: S.of(context).choose_address),
            body: state.when(
              initial: () {
                return SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomFormField(
                              ctrl: addAddressCubit.addressCtrl,
                              label: "Address",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.buildingCtrl,
                              label: "Building N0.",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.flatCtrl,
                              label: "Flat N0.",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.phoneCtrl,
                              label: "Phone",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.stateCtrl,
                              label: "State",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.cityCtrl,
                              label: "City",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.zipCodeCtrl,
                              label: "Zip Code",
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          child: CustomBtn(
                            label: S.current.add_new_address,
                            onPressed: () async {
                              addAddressCubit.addAddress(
                                Address(
                                  address: addAddressCubit.addressCtrl.text,
                                  building: addAddressCubit.buildingCtrl.text,
                                  flat: addAddressCubit.flatCtrl.text,
                                  code: addAddressCubit.zipCodeCtrl.text,
                                  state: addAddressCubit.stateCtrl.text,
                                  city: addAddressCubit.cityCtrl.text,
                                  phone: addAddressCubit.phoneCtrl.text,
                                ),
                              );
                              context.pop();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              loading: () {
                return const StateLoadingWidget();
              },
              success: () {
                return SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomFormField(
                              ctrl: addAddressCubit.addressCtrl,
                              label: "Address",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.buildingCtrl,
                              label: "Building N0.",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.flatCtrl,
                              label: "Flat N0.",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.phoneCtrl,
                              label: "Phone",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.stateCtrl,
                              label: "State",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.cityCtrl,
                              label: "City",
                            ),
                            CustomFormField(
                              ctrl: addAddressCubit.zipCodeCtrl,
                              label: "Zip Code",
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          child: CustomBtn(
                            label: S.current.add_new_address,
                            onPressed: () async {
                              addAddressCubit.addAddress(
                                Address(
                                  address: addAddressCubit.addressCtrl.text,
                                  building: addAddressCubit.buildingCtrl.text,
                                  flat: addAddressCubit.flatCtrl.text,
                                  code: addAddressCubit.zipCodeCtrl.text,
                                  state: addAddressCubit.stateCtrl.text,
                                  city: addAddressCubit.cityCtrl.text,
                                  phone: addAddressCubit.phoneCtrl.text,
                                ),
                              );

                              context.pop();
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

            ),
          );
        },
      ),
    );
  }
}
