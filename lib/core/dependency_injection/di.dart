import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Cubits
  // Login Cubit
  // di.registerFactory(() => LoginCubit(loginUseCase: di(), resendCodeUseCase: di()));

  /// UseCases

  /// Repos

  /// Services

  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
