
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/dependency_injection/di.dart' as di;
import 'core/helpers/cache_helper.dart';
import 'core/router/router_generator.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/cubit_observer.dart';
import 'generated/l10n.dart';
import 'main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppCubitObserver();
  await di.init();

  // await Firebase.initializeApp();
  // if (Platform.isAndroid) {
  //   FireBaseResources().android();
  // } else if (Platform.isIOS) {
  //   FireBaseResources().ios();
  // }

  String currentLocale = await CacheHelper.getAppLang();
  var email = await CacheHelper.getData("email");
  var pass = await CacheHelper.getData("pass");
  debugPrint("Email: $email\n Pass: $pass");

  runApp(
    MyApp(
      currentLang: currentLocale,
    ),
  );
}

class MyApp extends StatefulWidget {
  final String currentLang;

  const MyApp({super.key, required this.currentLang});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   super.initState();
  //
  //   FirebaseMessaging.onMessage.listen(
  //         (RemoteMessage message) {
  //       context.defaultSnackBar(message.notification?.title ?? AppConstants.unknownStringValue);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (ctx, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale('ar'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: AppStrings.appName,
          onGenerateRoute: AppRouters.routeGenerator,
          home: child,
        );
      },
      child: const MainView(),
    );
  }
}
