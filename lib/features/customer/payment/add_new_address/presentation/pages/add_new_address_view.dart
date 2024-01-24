import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:marketc/core/router/router.dart';
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
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../manager/add_address_cubit.dart';

class AddNewAddressView extends StatefulWidget {
  final Placemark address;
  const AddNewAddressView({super.key, required this.address});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  final Address address = Address();
  final HiveDatabase hiveDatabase = HiveDatabase();

  TextEditingController addressCtrl = TextEditingController();
  TextEditingController buildingCtrl = TextEditingController();
  TextEditingController flatCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController zipCodeCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressCtrl=TextEditingController(text: widget.address.street);
    stateCtrl=TextEditingController(text: widget.address.administrativeArea);
    cityCtrl=TextEditingController(text: widget.address.subAdministrativeArea);
    zipCodeCtrl=TextEditingController(text: widget.address.postalCode);
  }
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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p16),
                child: state.when(
                  initial: () {
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomFormField(
                                ctrl: addressCtrl,
                                label: "Address",
                              ),
                              CustomFormField(
                                ctrl: buildingCtrl,
                                label: "Building N0.",
                              ),
                              CustomFormField(
                                ctrl: flatCtrl,
                                label: "Flat N0.",
                              ),
                              CustomFormField(
                                ctrl: phoneCtrl,
                                label: "Phone",
                              ),
                              CustomFormField(
                                ctrl: stateCtrl,
                                label: "State",
                              ),
                              CustomFormField(
                                ctrl: cityCtrl,
                                label: "City",
                              ),
                              CustomFormField(
                                ctrl: zipCodeCtrl,
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
                                    address: addressCtrl.text,
                                    building: buildingCtrl.text,
                                    flat: flatCtrl.text,
                                    code: zipCodeCtrl.text,
                                    country: stateCtrl.text,
                                    city: cityCtrl.text,
                                    phone: phoneCtrl.text,
                                  ),
                                );
                                context.pushReplacementNamed(savedAddressesPageRoute);
                              },
                            ),
                          ),
                        )
                      ],
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
                                  ctrl: addressCtrl,
                                  label: "Address",
                                ),
                                CustomFormField(
                                  ctrl: buildingCtrl,
                                  label: "Building N0.",
                                ),
                                CustomFormField(
                                  ctrl: flatCtrl,
                                  label: "Flat N0.",
                                ),
                                CustomFormField(
                                  ctrl: phoneCtrl,
                                  label: "Phone",
                                ),
                                CustomFormField(
                                  ctrl: stateCtrl,
                                  label: "State",
                                ),
                                CustomFormField(
                                  ctrl: cityCtrl,
                                  label: "City",
                                ),
                                CustomFormField(
                                  ctrl: zipCodeCtrl,
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
                                      address: addressCtrl.text,
                                      building:
                                          buildingCtrl.text,
                                      flat: flatCtrl.text,
                                      code: zipCodeCtrl.text,
                                      country: stateCtrl.text,
                                      city: cityCtrl.text,
                                      phone: phoneCtrl.text,
                                    ),
                                  );
                                  context.pushReplacementNamed(savedAddressesPageRoute);
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
              ),
            ),
          );
        },
      ),
    );
  }
}
