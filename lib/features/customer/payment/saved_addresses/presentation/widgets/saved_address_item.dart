import 'package:flutter/material.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/shared/arguments.dart';
import 'package:marketc/core/utils/extensions.dart';

import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class SavedAddressItem extends StatelessWidget {
  final num sharedPrice;
  final String address;
  final String buildingNo;
  final String flatNo;
  final String phone;
  final String country;
  final String city;

  const SavedAddressItem({
    super.key,
    required this.sharedPrice,
    required this.address,
    required this.buildingNo,
    required this.flatNo,
    required this.phone,
    required this.country,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(paymentGateWayPageRoute,
            arguments: PaymentSharedPrice(sharedPrice: sharedPrice));
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
                    address.isNullOrEmpty(),
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
                    buildingNo.isNullOrEmpty(),
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
                    flatNo.isNullOrEmpty(),
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
                    phone.isNullOrEmpty(),
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
                    country.isNullOrEmpty(),
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
                    city.isNullOrEmpty(),
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
