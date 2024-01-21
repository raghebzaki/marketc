import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../core/database/address_class.dart';
import '../../../../../../core/database/database_db.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/l10n.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  late final Box box;
  Address address = Address();

  // @override
  // void initState() {
  //   super.initState();
  //   openBox();
  // }

  // openBox() async {
  //   box = await Hive.openBox("Address DataBase");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: S.of(context).choose_address),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(HiveBoxes.addressBox.values.length, (index) {
                    debugPrint(HiveBoxes.addressBox.values.length.toString());
                    // debugPrint(HiveBoxes.addressBox.values[index].toString());
                    return Column(
                      children: [
                        Text(
                          address.id![index].isNullOrEmpty(),
                        ),
                        Text(
                          address.address![index].isNullOrEmpty(),
                        ),
                        Text(
                          address.building![index].isNullOrEmpty(),
                        ),
                        Text(
                          address.flat![index].isNullOrEmpty(),
                        ),
                        Text(
                          address.phone![index].isNullOrEmpty(),
                        ),
                        Text(
                          address.city![index].isNullOrEmpty(),
                        ),
                        Text(
                          address.state![index].isNullOrEmpty(),
                        ),
                        Text(
                          address.code![index].isNullOrEmpty(),
                        ),
                      ],
                    );
                  }),
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
                    //  box = await Hive.openBox("Address Database");
                    // box.add(
                    //   Address(
                    //     address: "Address 1",
                    //     building: "2",
                    //     flat: "15",
                    //     phone: "01234567890",
                    //     city: "Cairo",
                    //     state: "Egypt",
                    //     code: "12345",
                    //   ),
                    // );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
