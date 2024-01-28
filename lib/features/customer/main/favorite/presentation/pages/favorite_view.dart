import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_search_form_field.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primary,
      appBar:  CustomAppBar(
        title: S.of(context).favorite,
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
                CustomSearchFormField(
                  label: S.current.you_think,
                  sufIcon: Icon(MdiIcons.magnify, size: 18.sp),
                ),
                Gap(15.h),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 2.0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2 / 3,
                  children: [
                    ...List.generate(
                      10,
                          (index) {
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
