import 'package:flutter/material.dart';
import 'package:marketc/core/database/address_class.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/arguments.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class SavedAddressItem extends StatelessWidget {
  final Address address;

  const SavedAddressItem({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(paymentDetailsPageRoute,arguments: AddressArgs(address: address));
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.p16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).address}:   ",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.address.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).building_no}:   ",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.building.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).flat_no}:   ",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.flat.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).phone}:   ",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.phone.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).state}:   ",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.country.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).city}:   ",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.city.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
