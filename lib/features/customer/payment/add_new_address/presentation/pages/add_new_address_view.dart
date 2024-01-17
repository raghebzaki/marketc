import 'package:flutter/material.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/app_colors.dart';

import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: S.of(context).choose_address),
      body: SafeArea(
        child: Stack(
          children: [
            const SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: CustomBtn(
                  label: S.current.add_new_address,
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
