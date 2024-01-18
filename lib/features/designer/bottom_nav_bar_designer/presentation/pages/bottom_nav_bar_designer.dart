
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketc/features/designer/main/home/presentation/pages/designer_home_view.dart';
import 'package:marketc/features/designer/main/subscriptions/presentation/pages/subscriptions_view.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../main/categories/presentation/pages/designer_view.dart';
import '../../../main/profile/presentation/pages/designer_profile_view.dart';
import '../../../product/add_product/presentation/pages/add_product.dart';


class BottomNavBarDesigner extends StatefulWidget {
  const BottomNavBarDesigner({Key? key}) : super(key: key);

  @override
  State<BottomNavBarDesigner> createState() => _BottomNavBarDesignerState();
}

class _BottomNavBarDesignerState extends State<BottomNavBarDesigner> {

  int currentIndex=0;
  final List<Widget> _body =[
    const DesignerHomeView(),
    const DesignerCategoriesView(),
    const AddProductView(),
    const SubscriptionsView(),
    const DesignerProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _body.elementAt(currentIndex),
      bottomNavigationBar: SafeArea(
        child:BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedLabelStyle:const TextStyle(color: Colors.white) ,
          onTap: (index){
            setState(() {
              currentIndex=index;
            });
          },
          items:   <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.homeImg, height: 32.h, width: 32.w,),
              label: "",
              //backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.categoriesImg, height: 32.h, width: 32.w,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.bagImg, height: 32.h, width: 32.w,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.saleImg, height: 32.h, width: 32.w,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.userIconImg, height: 32.h, width: 32.w,),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
