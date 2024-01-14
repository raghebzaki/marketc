import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketc/config/themes/app_text_styles.dart';
import 'package:marketc/core/shared/widgets/custom_form_field.dart';
import 'package:marketc/core/shared/widgets/product_card.dart';
import 'package:marketc/core/utils/app_colors.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 21,
                  ),
                  Gap(10.w),
                  const Expanded(
                    child: SizedBox(height: 35,
                      child: CustomFormField(
                        borderRadius: 8,
                        label:'بما تفكر؟',
                        sufIcon: Icon(Icons.search),

                      ),
                    ),
                  ),
                  Gap(10.w),
                  Icon(Icons.notifications_none,size: 20.sp,),
                ],
              ),
              Text(
                'مرحبا بك في عالم التسوق',
                style: CustomTextStyle.kTextStyleF20,
              ),
              Text(
                'دعنا نساعدك في العثور على الملابس المناسبة لك\nوتطريز الشعار والعبارات التي تحبها',
                textAlign: TextAlign.right,
                style: CustomTextStyle.kTextStyleF14.copyWith(color: AppColors.textColor),
              ),
              const ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
