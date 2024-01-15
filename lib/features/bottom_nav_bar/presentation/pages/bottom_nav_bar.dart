
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketc/features/main/cart/presentation/pages/cart_view.dart';
import 'package:marketc/features/main/favorite/presentation/pages/favorite_view.dart';
import 'package:marketc/features/main/home/presentation/pages/home_view.dart';
import 'package:marketc/features/main/profile/presentation/pages/profile_view.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex=0;
  final List<Widget> _body =[
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      body: _body.elementAt(currentIndex),
      bottomNavigationBar: SafeArea(
        bottom: true,
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
              icon: Icon(Icons.home,color: Colors.black,size: 32.sp),
              label: "",
              //backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,size: 32.sp),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,color: Colors.black,size: 32.sp),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black,size: 32.sp),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
