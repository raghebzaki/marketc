import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/core/shared/models/user_data_model.dart';
import 'package:marketc/features/customer/main/search/presentation/manager/search_cubit.dart';
import 'package:marketc/features/customer/main/search/presentation/pages/search_view.dart';
import 'package:marketc/features/designer/main/categories/domain/entities/my_designer_products_entity.dart';
import 'package:marketc/features/designer/main/categories/presentation/manager/my_designer_products_cubit.dart';
import 'package:marketc/features/designer/main/home/presentation/manager/designer_carousel_cubit.dart';
import 'package:marketc/features/designer/product/edit_product/presentation/manager/edit_product_cubit.dart'
    as edit;

import '../../features/auth/change_pass/presentation/pages/change_pass_confirmation.dart';
import '../../features/auth/change_pass/presentation/pages/change_pass_view.dart';
import '../../features/auth/fcm_token/domain/entities/token_entity.dart';
import '../../features/auth/fcm_token/presentation/manager/token_cubit.dart';
import '../../features/auth/forgot_pass/presentation/pages/forgot_pass_view.dart';
import '../../features/auth/login/presentation/pages/login_view.dart';
import '../../features/auth/register/presentation/pages/register_view.dart';
import '../../features/auth/reset_pass/presentation/pages/reset_pass_view.dart';
import '../../features/auth/verify_account/presentation/pages/verify_account_view.dart';
import '../../features/customer/bottom_nav_bar/presentation/pages/bottom_nav_bar.dart';
import '../../features/customer/main/cart/presentation/pages/cart_view.dart';
import '../../features/customer/main/category_details/domain/entities/category_details_entity.dart';
import '../../features/customer/main/category_details/presentation/manager/category_details_cubit.dart';
import '../../features/customer/main/category_details/presentation/pages/category_details_view.dart';
import '../../features/customer/main/home/presentation/manager/carousel_cubit.dart';
import '../../features/customer/main/home/presentation/manager/category_cubit.dart';
import '../../features/customer/main/home/presentation/manager/most_popular_cubit.dart';
import '../../features/customer/main/home/presentation/manager/new_products_cubit.dart';
import '../../features/customer/main/home/presentation/pages/home_view.dart';
import '../../features/customer/main/home/presentation/pages/most_popular_see_more_view.dart';
import '../../features/customer/main/home/presentation/pages/new_products_see_more_view.dart';
import '../../features/customer/main/product_details/presentation/pages/product_details_view.dart';
import '../../features/customer/main/search/domain/entities/search_entity.dart';
import '../../features/customer/orders/my_orders/presentation/pages/my_orders.dart';
import '../../features/customer/orders/order_confirmation_view.dart';
import '../../features/customer/orders/order_details/presentation/pages/order_details_view.dart';
import '../../features/customer/orders/track_order/presentation/pages/track_order_view.dart';
import '../../features/customer/payment/add_new_address/presentation/pages/add_new_address_view.dart';
import '../../features/customer/payment/map/presentation/pages/map_view.dart';
import '../../features/customer/payment/payment_details/presentation/pages/payment_details_view.dart';
import '../../features/customer/payment/payment_gate_way/presentation/pages/payment_gate_way_view.dart';
import '../../features/customer/payment/payment_summary/presentation/pages/payment_summary_view.dart';
import '../../features/customer/payment/saved_addresses/presentation/pages/saved_addresses_view.dart';
import '../../features/customer/profile/contact_us/presentation/pages/contact_us_view.dart';
import '../../features/customer/profile/edit_profile/presentation/pages/edit_profile_view.dart';
import '../../features/customer/profile/notifications/presentation/pages/notifications_view.dart';
import '../../features/customer/profile/saved_addresses/presentation/pages/profile_saved_addresses_view.dart';
import '../../features/customer/profile/settings/presentation/pages/settings_view.dart';
import '../../features/designer/bottom_nav_bar_designer/presentation/pages/bottom_nav_bar_designer.dart';
import '../../features/designer/designs/presentation/pages/designs_view.dart';
import '../../features/designer/main/categories/presentation/pages/designer_categories_view.dart';
import '../../features/designer/main/home/presentation/pages/designer_home_view.dart';
import '../../features/designer/main/profile/presentation/pages/profile_view.dart';
import '../../features/designer/main/subscriptions/presentation/pages/subscriptions_view.dart';
import '../../features/designer/product/add_product/presentation/pages/add_product_view.dart';
import '../../features/designer/product/edit_product/presentation/pages/edit_product_view.dart';
import '../../features/designer/profile/settings/presentation/pages/settings_view.dart';
import '../../features/designer/profile/user_balance/presentation/pages/user_balance_view.dart';
import '../../features/on_boarding/presentation/pages/on_boarding_view.dart';
import '../../main_view.dart';
import '../dependency_injection/di.dart' as di;
import '../shared/arguments.dart';
import '../utils/app_constants.dart';
import 'router.dart';

class AppRouters {
  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case mainViewPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
      case onBoardingPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OnBoardingView(),
        );

      /// Auth
      case loginPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );
      case registerPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RegisterView(),
        );
      case verifyAccountPageRoute:
        final args = settings.arguments as VerifyAccountArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => VerifyAccountView(
            email: args.email,
          ),
        );
      case forgotPassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPassView(),
        );
      case resetPassPageRoute:
        final args = settings.arguments as ResetPassArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => ResetPassView(
            email: args.email,
          ),
        );
      case changePassPageRoute:
        final args = settings.arguments as ChangePassArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => ChangePassView(
            email: args.email,
          ),
        );
      case changePassConfirmationPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChangePassConfirmationView(),
        );

      /// Main
      case bottomNavBarPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavBar(),
        );
      case homePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                di.di<TokenCubit>()..updateFcmToken(TokenEntity(
                  userId: UserData.id,
                  token: AppConstants.fcmToken,
                )),
              ),
              BlocProvider(
                create: (context) => di.di<CarouselCubit>()..getAds(1),
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
            ],
            child: const HomeView(),
          ),
        );
      case searchPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<SearchCubit>()
              ..searchProducts(
                const SearchEntity(
                  searchText: "''",
                  nextPage: 1,
                ),
              ),
            child: const SearchView(),
          ),
        );
      case mostPopularSeeMorePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<MostPopularCubit>()..getAllProducts(1),
            child: const MostPopularSeeMoreView(),
          ),
        );
      case newProductsSeeMorePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<NewProductsCubit>()..getAllProducts(1),
            child: const NewProductsSeeMoreView(),
          ),
        );
      case categoryDetailsPageRoute:
        final args = settings.arguments as CategoryDetailsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<CategoryDetailsCubit>()
              ..getProducts(
                CategoryDetailsEntity(
                  categoryId: args.id,
                  filterId: 1,
                  nextPage: 1,
                ),
              ),
            child: CategoryDetailsView(
              id: args.id,
              name: args.name,
            ),
          ),
        );
      case productDetailsPageRoute:
        final args = settings.arguments as ProductsEntityArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductDetailsView(
            productEntity: args.productEntity,
          ),
        );
      case cartPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CartView(),
        );
      case contactUsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ContactUsView(),
        );
      case notificationsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotificationsView(),
        );
      case settingsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SettingsView(),
        );
      case orderConfirmationPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OrderConfirmationView(),
        );
      case trackOrderPageRoute:
        final args = settings.arguments as OrderDetailsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => TrackOrderView(
            orderDetails: args.orderDetails,
          ),
        );
      case subscriptionsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubscriptionsView(),
        );
      case myOrdersPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MyOrdersView(),
        );
      case editProfilePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const EditProfileView(),
        );
      case orderDetailsPageRoute:
        final args = settings.arguments as OrderDetailsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              OrderDetailsView(orderDetails: args.orderDetails),
        );
      case paymentDetailsPageRoute:
        final args = settings.arguments as AddressArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              PaymentDetailsView(address: args.address),
        );
      case savedAddressesPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SavedAddressesView(),
        );
      case profileSavedAddressesPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProfileSavedAddressesView(),
        );
      case mapPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MapView(),
        );
      case addNewAddressPageRoute:
        final args = settings.arguments as NewAddressArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              AddNewAddressView(address: args.address),
        );
      case paymentGateWayPageRoute:
        final args = settings.arguments as AddressArgs;

        return MaterialPageRoute(
          builder: (BuildContext context) => PaymentGateWayView(
            address: args.address,
            name: args.name!,
          ),
        );
      case paymentSummaryPageRoute:
        final args = settings.arguments as PaymentSharedPrice;
        return MaterialPageRoute(
          builder: (BuildContext context) => PaymentSummaryView(
            finalPrice: args.sharedPrice,
            address: args.address,
            name: args.name,
            gift: args.gift,
            askAboutAddress: args.askAboutAddress,
          ),
        );

      /// designer
      case designerBottomNavBarPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavBarDesigner(),
        );
      case designerHomePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<DesignerCarouselCubit>()..getAds(1),
            child: const DesignerHomeView(),
          ),
        );
      case designerProfilePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DesignerProfileView(),
        );
      case userBalancePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const UserBalanceView(),
        );
      case designerSettingPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DesignerSettingsView(),
        );
      case designerCategoryPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<MyDesignerProductsCubit>()
              ..getProducts(MyDesignerProductsEntity(userId: UserData.id), 1),
            child: const DesignerCategoriesView(),
          ),
        );
      case addProductPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AddProductView(),
        );
      case editProductPageRoute:
        final args = settings.arguments as EditProductArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<edit.EditProductCubit>(),
            child: EditProductView(productDetails: args.productDetails),
          ),
        );
      case designsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DesignsView(),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
