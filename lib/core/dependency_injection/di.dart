import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/change_pass/data/data_sources/change_pass_service.dart';
import '../../features/auth/change_pass/data/repositories/change_pass_repo_impl.dart';
import '../../features/auth/change_pass/domain/repositories/change_pass_repo.dart';
import '../../features/auth/change_pass/domain/use_cases/change_pass_usecase.dart';
import '../../features/auth/change_pass/presentation/manager/change_pass_cubit.dart';
import '../../features/auth/forgot_pass/data/data_sources/forgot_pass_service.dart';
import '../../features/auth/forgot_pass/data/repositories/forget_pass_repo_impl.dart';
import '../../features/auth/forgot_pass/domain/repositories/forget_pass_repo.dart';
import '../../features/auth/forgot_pass/domain/use_cases/forget_pass_usecase.dart';
import '../../features/auth/forgot_pass/presentation/manager/forgot_pass_cubit.dart';
import '../../features/auth/login/data/data_sources/login_service.dart';
import '../../features/auth/login/data/repositories/login_repo_impl.dart';
import '../../features/auth/login/domain/repositories/login_repo.dart';
import '../../features/auth/login/domain/use_cases/login_use_case.dart';
import '../../features/auth/login/presentation/manager/login_cubit.dart';
import '../../features/auth/register/data/data_sources/lcheck_registered_email_service.dart';
import '../../features/auth/register/data/data_sources/register_service.dart';
import '../../features/auth/register/data/repositories/register_repo_impl.dart';
import '../../features/auth/register/domain/repositories/register_repo.dart';
import '../../features/auth/register/domain/use_cases/check_registered_email_usecase.dart';
import '../../features/auth/register/domain/use_cases/register_usecase.dart';
import '../../features/auth/register/presentation/manager/register_cubit.dart';
import '../../features/auth/reset_pass/data/data_sources/resend_code_service.dart';
import '../../features/auth/reset_pass/data/data_sources/reset_pass_service.dart';
import '../../features/auth/reset_pass/data/repositories/reset_pass_repo_impl.dart';
import '../../features/auth/reset_pass/domain/repositories/reset_pass_repo.dart';
import '../../features/auth/reset_pass/domain/use_cases/resend_code_usecase.dart';
import '../../features/auth/reset_pass/domain/use_cases/reset_pass_usecase.dart';
import '../../features/auth/reset_pass/presentation/manager/verify_account_cubit.dart';
import '../../features/auth/verify_account/data/data_sources/resend_code_service.dart';
import '../../features/auth/verify_account/data/data_sources/verify_account_service.dart';
import '../../features/auth/verify_account/data/repositories/verify_account_repo_impl.dart';
import '../../features/auth/verify_account/domain/repositories/verify_account_repo.dart';
import '../../features/auth/verify_account/domain/use_cases/resend_code_usecase.dart';
import '../../features/auth/verify_account/domain/use_cases/verify_account_usecase.dart';
import '../../features/auth/verify_account/presentation/manager/verify_account_cubit.dart';
import '../../features/customer/main/category_details/data/data_sources/category_details_serivce.dart';
import '../../features/customer/main/category_details/data/repositories/category_details_repo_impl.dart';
import '../../features/customer/main/category_details/domain/repositories/category_details_repo.dart';
import '../../features/customer/main/category_details/domain/use_cases/get_category_products_usecase.dart';
import '../../features/customer/main/category_details/presentation/manager/category_details_cubit.dart';
import '../../features/customer/main/favorite/data/data_sources/favorite_service.dart';
import '../../features/customer/main/favorite/data/repositories/favorite_repo_impl.dart';
import '../../features/customer/main/favorite/domain/repositories/favorite_repo.dart';
import '../../features/customer/main/favorite/domain/use_cases/favorite_use_case.dart';
import '../../features/customer/main/favorite/presentation/manager/favorite_cubit.dart';
import '../../features/customer/main/home/data/data_sources/carousel_service.dart';
import '../../features/customer/main/home/data/data_sources/category_service.dart';
import '../../features/customer/main/home/data/data_sources/most_popular_service.dart';
import '../../features/customer/main/home/data/data_sources/new_products_service.dart';
import '../../features/customer/main/home/data/repositories/carousel_repo_impl.dart';
import '../../features/customer/main/home/data/repositories/category_repo_impl.dart';
import '../../features/customer/main/home/data/repositories/most_popular_repo_impl.dart';
import '../../features/customer/main/home/data/repositories/new_products_repo_impl.dart';
import '../../features/customer/main/home/domain/repositories/carousel_repo.dart';
import '../../features/customer/main/home/domain/repositories/category_repo.dart';
import '../../features/customer/main/home/domain/repositories/most_popular_repo.dart';
import '../../features/customer/main/home/domain/repositories/new_products_repo.dart';
import '../../features/customer/main/home/domain/use_cases/carousel_use_case.dart';
import '../../features/customer/main/home/domain/use_cases/category_use_case.dart';
import '../../features/customer/main/home/domain/use_cases/most_popular_use_case.dart';
import '../../features/customer/main/home/domain/use_cases/new_products_use_case.dart';
import '../../features/customer/main/home/presentation/manager/carousel_cubit.dart';
import '../../features/customer/main/home/presentation/manager/category_cubit.dart';
import '../../features/customer/main/home/presentation/manager/most_popular_cubit.dart';
import '../../features/customer/main/home/presentation/manager/new_products_cubit.dart';
import '../../features/customer/orders/my_orders/data/data_sources/my_orders_service.dart';
import '../../features/customer/orders/my_orders/data/repositories/my_orders_repo_impl.dart';
import '../../features/customer/orders/my_orders/domain/repositories/my_orders_repo.dart';
import '../../features/customer/orders/my_orders/domain/use_cases/my_orders_usecase.dart';
import '../../features/customer/orders/my_orders/presentation/manager/my_orders_cubit.dart';
import '../../features/customer/orders/track_order/data/data_sources/cancel_order_service.dart';
import '../../features/customer/orders/track_order/data/repositories/cancel_order_repo_impl.dart';
import '../../features/customer/orders/track_order/domain/repositories/cancel_order_repo.dart';
import '../../features/customer/orders/track_order/domain/use_cases/cancel_order_usecase.dart';
import '../../features/customer/orders/track_order/presentation/manager/cancel_order_cubit.dart';
import '../../features/customer/payment/payment_gate_way/data/data_sources/promo_code_service.dart';
import '../../features/customer/payment/payment_gate_way/data/repositories/promo_code_repo_impl.dart';
import '../../features/customer/payment/payment_gate_way/domain/repositories/promo_code_repo.dart';
import '../../features/customer/payment/payment_gate_way/domain/use_cases/promo_code_use_case.dart';
import '../../features/customer/payment/payment_gate_way/presentation/manager/promo_code_cubit.dart';
import '../../features/customer/payment/payment_summary/data/data_sources/place_order_service.dart';
import '../../features/customer/payment/payment_summary/data/repositories/place_order_repo_impl.dart';
import '../../features/customer/payment/payment_summary/domain/repositories/place_order_repo.dart';
import '../../features/customer/payment/payment_summary/domain/use_cases/place_order_use_case.dart';
import '../../features/customer/payment/payment_summary/presentation/manager/place_order_cubit.dart';
import '../../features/customer/profile/contact_us/data/data_sources/contact_us_service.dart';
import '../../features/customer/profile/contact_us/data/repositories/contact_us_repo_impl.dart';
import '../../features/customer/profile/contact_us/domain/repositories/contact_us_repo.dart';
import '../../features/customer/profile/contact_us/domain/use_cases/contact_us_use_case.dart';
import '../../features/customer/profile/contact_us/presentation/manager/contact_us_cubit.dart';
import '../../features/customer/profile/edit_profile/data/data_sources/edit_profile_service.dart';
import '../../features/customer/profile/edit_profile/data/repositories/edit_profile_repo_impl.dart';
import '../../features/customer/profile/edit_profile/domain/repositories/edit_profile_repo.dart';
import '../../features/customer/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import '../../features/customer/profile/edit_profile/presentation/manager/edit_profile_cubit.dart';
import '../../features/designer/main/home/data/data_sources/designer_carousel_service.dart';
import '../../features/designer/main/home/data/repositories/designer_carousel_repo_impl.dart';
import '../../features/designer/main/home/domain/repositories/designer_carousel_repo.dart';
import '../../features/designer/main/home/domain/use_cases/designer_carousel_use_case.dart';
import '../../features/designer/main/home/presentation/manager/designer_carousel_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Login
  di.registerFactory(() => LoginCubit(loginUseCase: di()));
  di.registerLazySingleton(() => LoginUseCase(loginRepo: di()));
  di.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(loginService: di()));
  di.registerLazySingleton<LoginService>(() => LoginServiceImpl());

  /// Forgot Password
  di.registerFactory(() => ForgotPassCubit(forgotPassUseCase: di()));
  di.registerLazySingleton(() => ForgotPassUseCase(forgotPassRepo: di()));
  di.registerLazySingleton<ForgotPassRepo>(
      () => ForgotPassRepoImpl(forgotPassService: di()));
  di.registerLazySingleton<ForgotPassService>(() => ForgotPassServiceImpl());

  /// Reset Password
  di.registerFactory(
      () => ResetPassCubit(resetPassUseCase: di(), resendCodeUseCase: di()));
  di.registerLazySingleton(() => ResetPassUseCase(resetPassRepo: di()));
  di.registerLazySingleton<ResetPassRepo>(
      () => ResetPassRepoImpl(resetPassService: di(), resendCodeService: di()));
  di.registerLazySingleton<ResetPassService>(() => ResetPassServiceImpl());
  di.registerLazySingleton<ResendCodeService>(() => ResendCodeServiceImpl());

  /// Change Password
  di.registerFactory(() => ChangePassCubit(changePassUseCase: di()));
  di.registerLazySingleton(() => ChangePassUseCase(di()));
  di.registerLazySingleton(() => ResendCodeUseCase(resetPassRepo: di()));
  di.registerLazySingleton<ChangePassRepo>(() => ChangePassRepoImpl(di()));
  di.registerLazySingleton<ChangePassService>(() => ChangePassServiceImpl());

  /// Register
  di.registerFactory(() =>
      RegisterCubit(registerUseCase: di(), checkRegisteredEmailUseCase: di()));
  di.registerLazySingleton(() => RegisterUseCase(registerRepo: di()));
  di.registerLazySingleton(
      () => CheckRegisteredEmailUseCase(registerRepo: di()));
  di.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(
      registerService: di(), checkRegisteredEmailService: di()));
  di.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());
  di.registerLazySingleton<CheckRegisteredEmailService>(
      () => CheckRegisteredEmailServiceImpl());

  /// Verify Account
  di.registerFactory(() =>
      VerifyAccountCubit(verifyAccountUseCase: di(), resendCodeUseCase: di()));
  di.registerLazySingleton(() => VerifyAccountUseCase(di()));
  di.registerLazySingleton(
      () => VerifyResendCodeUseCase(verifyAccountRepo: di()));
  di.registerLazySingleton<VerifyAccountRepo>(
      () => VerifyAccountRepoImpl(di(), di()));
  di.registerLazySingleton<VerifyAccountService>(
      () => VerifyAccountServiceImpl());
  di.registerLazySingleton<VerifyResendCodeService>(
      () => VerifyResendCodeServiceImpl());

  /// customer

  /// home page
  /// most popular
  di.registerFactory(() => MostPopularCubit(mostPopularUseCase: di()));
  di.registerLazySingleton(() => MostPopularUseCase(di()));
  di.registerLazySingleton<MostPopularRepo>(() => MostPopularRepoImpl(di()));
  di.registerLazySingleton<MostPopularService>(() => MostPopularServiceImpl());

  /// New Products
  di.registerFactory(() => NewProductsCubit(newProductsUseCase: di()));
  di.registerLazySingleton(() => NewProductsUseCase(di()));
  di.registerLazySingleton<NewProductsRepo>(() => NewProductsRepoImpl(di()));
  di.registerLazySingleton<NewProductsService>(() => NewProductsServiceImpl());
 /// category
  di.registerFactory(() => CategoryCubit(carouselUseCase: di()));
  di.registerLazySingleton(() => CategoryUseCase(di()));
  di.registerLazySingleton<CategoryRepo>(() => CategoryRepoImpl(di()));
  di.registerLazySingleton<CategoryService>(() => CategoryServiceImpl());
 /// carousel
  di.registerFactory(() => CarouselCubit(carouselUseCase: di()));
  di.registerLazySingleton(() => CarouselUseCase(di()));
  di.registerLazySingleton<CarouselRepo>(() => CarouselRepoImpl(di()));
  di.registerLazySingleton<CarouselService>(() => CarouselServiceImpl());

  /// Favorite products
  di.registerFactory(() => FavoriteCubit(favoriteUseCase: di()));
  di.registerLazySingleton(() => FavoriteUseCase(di()));
  di.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl(di()));
  di.registerLazySingleton<FavoriteService>(() => FavoriteServiceImpl());

  /// Category Details
  di.registerFactory(
      () => CategoryDetailsCubit(getCategoryProductsUseCase: di()));
  di.registerLazySingleton(
      () => GetCategoryProductsUseCase(categoryDetailsRepo: di()));
  di.registerLazySingleton<CategoryDetailsRepo>(
      () => CategoryDetailsRepoImpl(categoryProductsService: di()));
  di.registerLazySingleton<CategoryProductsService>(
      () => CategoryProductsServiceImpl());

  /// Orders
  /// My Orders
  di.registerFactory(() => MyOrdersCubit(myOrdersUseCase: di()));
  di.registerLazySingleton(() => MyOrdersUseCase(myOrdersRepo: di()));
  di.registerLazySingleton<MyOrdersRepo>(
      () => MyOrdersRepoImpl(myOrdersService: di()));
  di.registerLazySingleton<MyOrdersService>(() => MyOrdersServiceImpl());

  /// Cancel Order
  di.registerFactory(() => CancelOrderCubit(cancelOrderUseCase: di()));
  di.registerLazySingleton(() => CancelOrderUseCase(cancelOrderRepo: di()));
  di.registerLazySingleton<CancelOrderRepo>(
      () => CancelOrderRepoImpl(cancelOrderService: di()));
  di.registerLazySingleton<CancelOrderService>(() => CancelOrderServiceImpl());

  /// Payment View
  /// Place Order
  di.registerFactory(() => PlaceOrderCubit(placeOrderUseCase: di()));
  di.registerLazySingleton(() => PlaceOrderUseCase(placeOrderRepo: di()));
  di.registerLazySingleton<PlaceOrderRepo>(
      () => PlaceOrderRepoImpl(placeOrderService: di()));
  di.registerLazySingleton<PlaceOrderService>(() => PlaceOrderServiceImpl());
  /// PromoCode
  di.registerFactory(() => PromoCodeCubit(promoCodeUseCase: di()));
  di.registerLazySingleton(() => PromoCodeUseCase( di()));
  di.registerLazySingleton<PromoCodeRepo>(
      () => PromoCodeRepoImpl( di()));
  di.registerLazySingleton<PromoCodeService>(() => PromoCodeServiceImpl());
  /// profile View
  /// contact us
  di.registerFactory(() => ContactUsCubit(contactUsUseCase: di()));
  di.registerLazySingleton(() => ContactUsUseCase( di()));
  di.registerLazySingleton<ContactUsRepo>(() => ContactUsRepoImpl( di()));
  di.registerLazySingleton<ContactUsService>(() => ContactUsServiceImpl());
  /// edit profile
  di.registerFactory(() => EditProfileCubit(editProfileUseCase: di()));
  di.registerLazySingleton(() => EditProfileUseCase( di()));
  di.registerLazySingleton<EditProfileRepo>(() => EditProfileRepoImpl( di()));
  di.registerLazySingleton<EditProfileService>(() => EditProfileServiceImpl());

  /// Designer

  /// home page
  /// carousel
  di.registerFactory(() => DesignerCarouselCubit(carouselUseCase: di()));
  di.registerLazySingleton(() => DesignerCarouselUseCase(di()));
  di.registerLazySingleton<DesignerCarouselRepo>(() => DesignerCarouselRepoImpl(di()));
  di.registerLazySingleton<DesignerCarouselService>(() => DesignerCarouselServiceImpl());

  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
