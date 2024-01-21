import 'package:get_it/get_it.dart';
import 'package:marketc/features/customer/main/home/domain/use_cases/most_popular_use_case.dart';
import 'package:marketc/features/customer/main/home/presentation/manager/most_popular_cubit.dart';
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
import '../../features/auth/reset_pass/data/data_sources/reset_pass_service.dart';
import '../../features/auth/reset_pass/data/repositories/reset_pass_repo_impl.dart';
import '../../features/auth/reset_pass/domain/repositories/reset_pass_repo.dart';
import '../../features/auth/reset_pass/domain/use_cases/resend_code_usecase.dart';
import '../../features/auth/reset_pass/domain/use_cases/reset_pass_usecase.dart';
import '../../features/auth/reset_pass/presentation/manager/verify_account_cubit.dart';
import '../../features/auth/verify_account/data/data_sources/verify_account_service.dart';
import '../../features/auth/verify_account/data/repositories/verify_account_repo_impl.dart';
import '../../features/auth/verify_account/domain/repositories/verify_account_repo.dart';
import '../../features/auth/verify_account/domain/use_cases/resend_code_usecase.dart';
import '../../features/auth/verify_account/domain/use_cases/verify_account_usecase.dart';
import '../../features/auth/verify_account/presentation/manager/verify_account_cubit.dart';
import '../../features/customer/main/favorite/data/data_sources/favorite_service.dart';
import '../../features/customer/main/favorite/data/repositories/favorite_repo_impl.dart';
import '../../features/customer/main/favorite/domain/repositories/favorite_repo.dart';
import '../../features/customer/main/favorite/domain/use_cases/favorite_use_case.dart';
import '../../features/customer/main/favorite/presentation/manager/favorite_cubit.dart';
import '../../features/customer/main/home/data/data_sources/most_popular_service.dart';
import '../../features/customer/main/home/data/data_sources/new_products_service.dart';
import '../../features/customer/main/home/data/repositories/most_popular_repo_impl.dart';
import '../../features/customer/main/home/data/repositories/new_products_repo_impl.dart';
import '../../features/customer/main/home/domain/repositories/most_popular_repo.dart';
import '../../features/customer/main/home/domain/repositories/new_products_repo.dart';
import '../../features/customer/main/home/domain/use_cases/new_products_use_case.dart';
import '../../features/customer/main/home/presentation/manager/new_products_cubit.dart';

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

  /// home page
  /// most popular
  di.registerFactory(() => MostPopularCubit(mostPopularUseCase: di()));
  di.registerLazySingleton(() => MostPopularUseCase( di()));
  di.registerLazySingleton<MostPopularRepo>(() => MostPopularRepoImpl( di()));
  di.registerLazySingleton<MostPopularService>(() => MostPopularServiceImpl());

  /// New Products
  di.registerFactory(() => NewProductsCubit(newProductsUseCase: di()));
  di.registerLazySingleton(() => NewProductsUseCase( di()));
  di.registerLazySingleton<NewProductsRepo>(() => NewProductsRepoImpl( di()));
  di.registerLazySingleton<NewProductsService>(() => NewProductsServiceImpl());

  /// Favorite products
  di.registerFactory(() => FavoriteCubit(favoriteUseCase: di()));
  di.registerLazySingleton(() => FavoriteUseCase( di()));
  di.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl( di()));
  di.registerLazySingleton<FavoriteService>(() => FavoriteServiceImpl());

  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
