import 'package:flutter/material.dart';

import '../../features/auth/login/presentation/pages/login_view.dart';
import '../../features/on_boarding/presentation/pages/on_boarding_view.dart';
import '../../main_view.dart';
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
        case loginPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );


      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
