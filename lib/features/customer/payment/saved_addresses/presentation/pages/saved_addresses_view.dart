import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/core/shared/widgets/custom_app_bar.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/customer/payment/saved_addresses/presentation/widgets/saved_address_item.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class SavedAddressesView extends StatefulWidget {
  const SavedAddressesView({super.key});

  @override
  State<SavedAddressesView> createState() => _SavedAddressesViewState();
}

class _SavedAddressesViewState extends State<SavedAddressesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: S.of(context).saved_addresses),
      body: SafeArea(
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
                    itemCount: 30,
                    itemBuilder: (ctx, index) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensions.p8),
                        child: SavedAddressItem(
                          label: "عنوان البيت",
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
                  onPressed: () {
                    context.pushNamed(addNewAddressPageRoute);
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
