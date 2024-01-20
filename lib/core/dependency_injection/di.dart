import 'package:get_it/get_it.dart';
import 'package:marketc/features/auth/register/data/data_sources/register_service.dart';
import 'package:marketc/features/auth/register/data/repositories/register_repo_impl.dart';
import 'package:marketc/features/auth/register/domain/repositories/register_repo.dart';
import 'package:marketc/features/auth/register/domain/use_cases/register_usecase.dart';
import 'package:marketc/features/auth/register/presentation/manager/client_register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/login/data/data_sources/login_service.dart';
import '../../features/auth/login/data/repositories/login_repo_impl.dart';
import '../../features/auth/login/domain/repositories/login_repo.dart';
import '../../features/auth/login/domain/use_cases/login_use_case.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Login
  // di.registerFactory(() => LoginCubit(loginUseCase: di(), resendCodeUseCase: di()));
  di.registerLazySingleton(() => LoginUseCase(loginRepo: di()));
  di.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(loginService: di()));
  di.registerLazySingleton<LoginService>(() => LoginServiceImpl());

  /// Register
  di.registerFactory(() => RegisterCubit(registerUseCase: di(),checkRegisteredEmailUseCase: di()));
  di.registerLazySingleton(() => RegisterUseCase(registerRepo: di()));
  di.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(registerService: di(),checkRegisteredEmailService: di()));
  di.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());
  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
