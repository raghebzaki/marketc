import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marketc/core/database/address_class.dart';
import 'package:marketc/core/database/database_hive.dart';
import 'package:marketc/core/shared/cubits/cart_cubit/cart_cubit.dart';

import 'core/dependency_injection/di.dart' as di;
import 'core/helpers/cache_helper.dart';
import 'core/my_http.dart';
import 'core/router/router_generator.dart';
import 'core/shared/entities/product_entity.dart';
import 'core/shared/entities/products_images_entity.dart';
import 'core/shared/widgets/custom_error_widget.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/cubit_observer.dart';
import 'features/designer/product/add_product/domain/entities/color_entity.dart';
import 'features/designer/product/add_product/domain/entities/size_entity.dart';
import 'generated/l10n.dart';
import 'main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppCubitObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(ProductSizesEntityAdapter());
  Hive.registerAdapter(ProductColorsEntityAdapter());
  Hive.registerAdapter(ProductsImagesEntityAdapter());
  Hive.registerAdapter(PivotEntityAdapter());
  await ScreenUtil.ensureScreenSize();
  await di.init();

  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ErrorWidgetClass(
          errorDetails: errorDetails,
        ),
      ),
    );
  };
  HttpOverrides.global = MyHttpOverrides();

  // await Firebase.initializeApp();
  // if (Platform.isAndroid) {
  //   FireBaseResources().android();
  // } else if (Platform.isIOS) {
  //   FireBaseResources().ios();
  // }

  // String currentLocale = await CacheHelper.getAppLang();
  var currentLocale = await CacheHelper.getLocal();

  runApp(
    MyApp(
      currentLang: currentLocale,
    ),
  );
}

class MyApp extends StatefulWidget {
  final Locale currentLang;

  const MyApp({super.key, required this.currentLang});

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLanguage(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale = const Locale("en");

  @override
  void initState() {
    super.initState();

    locale = widget.currentLang;
    // FirebaseMessaging.onMessage.listen(
    //       (RemoteMessage message) {
    //     context.defaultSnackBar(message.notification?.title ?? AppConstants.unknownStringValue);
    //   },
    // );
  }

  changeLanguage(Locale newLocale) {
    setState(() {
      locale = newLocale;
    });
  }

  HiveDatabase hiveDatabase = HiveDatabase();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(hiveDatabase),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (ctx, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale,
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
      ),
    );
  }
}
