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
import '../../features/customer/main/category_details/data/data_sources/sub_category_service.dart';
import '../../features/customer/main/category_details/data/repositories/category_details_repo_impl.dart';
import '../../features/customer/main/category_details/data/repositories/sub_category_repo_impl.dart';
import '../../features/customer/main/category_details/domain/repositories/category_details_repo.dart';
import '../../features/customer/main/category_details/domain/repositories/sub_category_repo.dart';
import '../../features/customer/main/category_details/domain/use_cases/get_category_products_usecase.dart';
import '../../features/customer/main/category_details/domain/use_cases/sub_category_use_case.dart';
import '../../features/customer/main/category_details/presentation/manager/category_details_cubit.dart';
import '../../features/customer/main/category_details/presentation/manager/sub_category_cubit.dart';
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
import '../../features/customer/main/product_details/data/data_sources/add_favorite_service.dart';
import '../../features/customer/main/product_details/data/repositories/add_favorite_repo_impl.dart';
import '../../features/customer/main/product_details/domain/repositories/add_favorite_model.dart';
import '../../features/customer/main/product_details/domain/use_cases/add_favorite_use_case.dart';
import '../../features/customer/main/product_details/presentation/manager/add_favorite_cubit.dart';
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
import '../../features/designer/designs/data/data_sources/designs_service.dart';
import '../../features/designer/designs/data/repositories/designs_repo_impl.dart';
import '../../features/designer/designs/domain/repositories/designs_repo.dart';
import '../../features/designer/designs/domain/use_cases/designs_use_case.dart';
import '../../features/designer/designs/presentation/manager/designs_cubit.dart';
import '../../features/designer/main/categories/data/data_sources/delete_product_service.dart';
import '../../features/designer/main/categories/data/data_sources/my_designer_products_service.dart';
import '../../features/designer/main/categories/data/repositories/delete_product_repo_impl.dart';
import '../../features/designer/main/categories/data/repositories/my_designer_products_repo_impl.dart';
import '../../features/designer/main/categories/domain/repositories/delete_product_repo.dart';
import '../../features/designer/main/categories/domain/repositories/my_designer_products_repo.dart';
import '../../features/designer/main/categories/domain/use_cases/delete_products_usecase.dart';
import '../../features/designer/main/categories/domain/use_cases/my_designer_products_usecase.dart';
import '../../features/designer/main/categories/presentation/manager/my_designer_products_cubit.dart';
import '../../features/designer/main/home/data/data_sources/designer_carousel_service.dart';
import '../../features/designer/main/home/data/repositories/designer_carousel_repo_impl.dart';
import '../../features/designer/main/home/domain/repositories/designer_carousel_repo.dart';
import '../../features/designer/main/home/domain/use_cases/designer_carousel_use_case.dart';
import '../../features/designer/main/home/presentation/manager/designer_carousel_cubit.dart';
import '../../features/designer/main/profile/data/data_sources/balance_service.dart';
import '../../features/designer/main/profile/data/data_sources/exchange_service.dart';
import '../../features/designer/main/profile/data/data_sources/get_points_service.dart';
import '../../features/designer/main/profile/data/repositories/balance_repo_impl.dart';
import '../../features/designer/main/profile/data/repositories/exchange_repo_impl.dart';
import '../../features/designer/main/profile/data/repositories/get_points_repo_impl.dart';
import '../../features/designer/main/profile/domain/repositories/balance_repo.dart';
import '../../features/designer/main/profile/domain/repositories/exchange_repo.dart';
import '../../features/designer/main/profile/domain/repositories/get_points_repo.dart';
import '../../features/designer/main/profile/domain/use_cases/balance_use_case.dart';
import '../../features/designer/main/profile/domain/use_cases/exchange_use_case.dart';
import '../../features/designer/main/profile/domain/use_cases/get_points_use_case.dart';
import '../../features/designer/main/profile/presentation/manager/balance_cubit.dart';
import '../../features/designer/main/profile/presentation/manager/exchange_cubit.dart';
import '../../features/designer/main/profile/presentation/manager/get_points_cubit.dart';
import '../../features/designer/product/add_product/data/data_sources/add_product_service.dart';
import '../../features/designer/product/add_product/data/data_sources/color_service.dart';
import '../../features/designer/product/add_product/data/data_sources/size_service.dart';
import '../../features/designer/product/add_product/data/repositories/add_product_repo_impl.dart';
import '../../features/designer/product/add_product/data/repositories/color_repo_impl.dart';
import '../../features/designer/product/add_product/data/repositories/size_repo_impl.dart';
import '../../features/designer/product/add_product/domain/repositories/add_product_repo.dart';
import '../../features/designer/product/add_product/domain/repositories/color_repo.dart';
import '../../features/designer/product/add_product/domain/repositories/size_repo.dart';
import '../../features/designer/product/add_product/domain/use_cases/add_product_usecase.dart';
import '../../features/designer/product/add_product/domain/use_cases/color_use_case.dart';
import '../../features/designer/product/add_product/domain/use_cases/size_use_case.dart';
import '../../features/designer/product/add_product/presentation/manager/add_product_cubit.dart';
import '../../features/designer/product/add_product/presentation/manager/color/colors_cubit.dart';
import '../../features/designer/product/add_product/presentation/manager/size/sizes_cubit.dart';
import '../../features/designer/product/edit_product/data/data_sources/edit_product_service.dart';
import '../../features/designer/product/edit_product/data/repositories/edit_product_repo_impl.dart';
import '../../features/designer/product/edit_product/domain/repositories/edit_product_repo.dart';
import '../../features/designer/product/edit_product/domain/use_cases/edit_product_usecase.dart';
import '../../features/designer/product/edit_product/presentation/manager/edit_product_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Login
  di.registerFactory(
      () => LoginCubit(loginUseCase: di(), verifyResendCodeUseCase: di()));
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

  /// sub category
  di.registerFactory(() => SubCategoryCubit(subCategoryUseCase: di()));
  di.registerLazySingleton(() => SubCategoryUseCase(di()));
  di.registerLazySingleton<SubCategoryRepo>(() => SubCategoryRepoImpl(di()));
  di.registerLazySingleton<SubCategoryService>(() => SubCategoryServiceImpl());

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

  /// Add Favorite
  di.registerFactory(() => AddFavoriteCubit(favoriteUseCase: di()));
  di.registerLazySingleton(() => AddFavoriteUseCase(addFavoriteRepo: di()));
  di.registerLazySingleton<AddFavoriteRepo>(() => AddFavoriteRepoImpl(addFavoriteService: di()));
  di.registerLazySingleton<AddFavoriteService>(() => AddFavoriteServiceImpl());

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
  di.registerLazySingleton(() => PromoCodeUseCase(di()));
  di.registerLazySingleton<PromoCodeRepo>(() => PromoCodeRepoImpl(di()));
  di.registerLazySingleton<PromoCodeService>(() => PromoCodeServiceImpl());

  /// profile View
  /// contact us
  di.registerFactory(() => ContactUsCubit(contactUsUseCase: di()));
  di.registerLazySingleton(() => ContactUsUseCase(di()));
  di.registerLazySingleton<ContactUsRepo>(() => ContactUsRepoImpl(di()));
  di.registerLazySingleton<ContactUsService>(() => ContactUsServiceImpl());

  /// edit profile
  di.registerFactory(() => EditProfileCubit(editProfileUseCase: di()));
  di.registerLazySingleton(() => EditProfileUseCase(di()));
  di.registerLazySingleton<EditProfileRepo>(() => EditProfileRepoImpl(di()));
  di.registerLazySingleton<EditProfileService>(() => EditProfileServiceImpl());

  /// Designer

  /// home page
  /// carousel
  di.registerFactory(() => DesignerCarouselCubit(carouselUseCase: di()));
  di.registerLazySingleton(() => DesignerCarouselUseCase(di()));
  di.registerLazySingleton<DesignerCarouselRepo>(
      () => DesignerCarouselRepoImpl(di()));
  di.registerLazySingleton<DesignerCarouselService>(
      () => DesignerCarouselServiceImpl());

  /// Designs View
  di.registerFactory(() => DesignsCubit(designsUseCase: di()));
  di.registerLazySingleton(() => DesignsUseCase(di()));
  di.registerLazySingleton<DesignsRepo>(() => DesignsRepoImpl(di()));
  di.registerLazySingleton<DesignsService>(() => DesignsServiceImpl());

  /// My Products + Delete Product
  /// product
  di.registerFactory(
      () => MyDesignerProductsCubit(myDesignerProductsUseCase: di()));
  di.registerLazySingleton(
      () => MyDesignerProductsUseCase(myDesignerProductsRepo: di()));
  di.registerLazySingleton<MyDesignerProductsRepo>(
      () => MyDesignerProductsRepoImpl(myDesignerProductsService: di()));
  di.registerLazySingleton<MyDesignerProductsService>(
      () => MyDesignerProductsServiceImpl());

  /// delete
  di.registerLazySingleton(() => DeleteProductUseCase(deleteProductRepo: di()));
  di.registerLazySingleton<DeleteProductRepo>(
      () => DeleteProductRepoImpl(deleteProductService: di()));
  di.registerLazySingleton<DeleteProductService>(
      () => DeleteProductServiceImpl());

  /// Add Product
  di.registerFactory(() => AddProductCubit(addProductUseCase: di()));
  di.registerLazySingleton(() => AddProductUseCase(addProductRepo: di()));
  di.registerLazySingleton<AddProductRepo>(
      () => AddProductRepoImpl(addProductService: di()));
  di.registerLazySingleton<AddProductService>(() => AddProductServiceImpl());

  /// Edit Product
  di.registerFactory(() => EditProductCubit(editProductUseCase: di()));
  di.registerLazySingleton(() => EditProductUseCase(editProductRepo: di()));
  di.registerLazySingleton<EditProductRepo>(
      () => EditProductRepoImpl(editProductService: di()));
  di.registerLazySingleton<EditProductService>(() => EditProductServiceImpl());

  ///profile
  /// balance
  di.registerFactory(() => BalanceCubit(balanceUseCase: di()));
  di.registerLazySingleton(() => BalanceUseCase(di()));
  di.registerLazySingleton<BalanceRepo>(() => BalanceRepoImpl(di()));
  di.registerLazySingleton<BalanceService>(() => BalanceServiceImpl());

  /// Exchange
  di.registerFactory(() => ExchangeCubit(exchangeUseCase: di()));
  di.registerLazySingleton(() => ExchangeUseCase(di()));
  di.registerLazySingleton<ExchangeRepo>(() => ExchangeRepoImpl(di()));
  di.registerLazySingleton<ExchangeService>(() => ExchangeServiceImpl());

  /// Get Points
  di.registerFactory(() => GetPointsCubit(getPointsUseCase: di()));
  di.registerLazySingleton(() => GetPointsUseCase(di()));
  di.registerLazySingleton<GetPointsRepo>(() => GetPointsRepoImpl(di()));
  di.registerLazySingleton<GetPointsService>(() => GetPointsServiceImpl());

  ///Add & Edit Product
  /// Colors
  di.registerFactory(() => ColorsCubit(colorsUseCase: di()));
  di.registerLazySingleton(() => ColorsUseCase(colorsRepo: di()));
  di.registerLazySingleton<ColorsRepo>(
      () => ColorsRepoImpl(colorService: di()));
  di.registerLazySingleton<ColorService>(() => ColorServiceImpl());

  /// Sizes
  di.registerFactory(() => SizesCubit(sizesUseCase: di()));
  di.registerLazySingleton(() => SizesUseCase(sizesRepo: di()));
  di.registerLazySingleton<SizesRepo>(() => SizesRepoImpl(sizeService: di()));
  di.registerLazySingleton<SizeService>(() => SizeServiceImpl());

  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
