
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/dependency_injection/di.dart'as di;
import '../../../../../core/shared/models/user_data_model.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../auth/fcm_token/domain/entities/token_entity.dart';
import '../../../../auth/fcm_token/presentation/manager/token_cubit.dart';
import '../../../main/cart/presentation/pages/cart_view.dart';
import '../../../main/favorite/presentation/pages/favorite_view.dart';
import '../../../main/home/presentation/manager/carousel_cubit.dart';
import '../../../main/home/presentation/manager/category_cubit.dart';
import '../../../main/home/presentation/manager/most_popular_cubit.dart';
import '../../../main/home/presentation/manager/new_products_cubit.dart';
import '../../../main/home/presentation/pages/home_view.dart';
import '../../../main/profile/presentation/pages/profile_view.dart';
import '../../../../../core/utils/app_images.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex=0;
  final List<Widget> _body =[
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          di.di<CarouselCubit>()..getAds(1),
        ),
        BlocProvider(
          create: (context) => di.di<CategoryCubit>()..getAllCategory(),
        ),
        BlocProvider(
          create: (context) =>
          di.di<NewProductsCubit>()..getAllProducts(1),
        ),
        BlocProvider(
          create: (context) =>
          di.di<MostPopularCubit>()..getAllProducts(1),
        ),
        BlocProvider(
          create: (context) =>
          di.di<TokenCubit>()..updateFcmToken(TokenEntity(
            userId: UserData.id,
            token: AppConstants.fcmToken,
          )),
        ),
      ], child: const HomeView(),
    ),

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
              icon: Image.asset(AppImages.homeIconImg, height: 32.h, width: 32.w,),
              label: "",
              //backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.cartIconImg, height: 32.h, width: 32.w,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.heartIconImg, height: 32.h, width: 32.w,),
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
