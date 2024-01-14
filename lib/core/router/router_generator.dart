import 'package:flutter/material.dart';
import 'package:marketc/features/auth/change_pass/presentation/pages/change_pass_view.dart';

import '../../features/auth/change_pass/presentation/pages/change_pass_confirmation.dart';
import '../../features/auth/forgot_pass/presentation/pages/forgot_pass_view.dart';
import '../../features/auth/login/presentation/pages/login_view.dart';
import '../../features/auth/register/presentation/pages/register_view.dart';
import '../../features/auth/reset_pass/presentation/pages/reset_pass_view.dart';
import '../../features/auth/verify_account/presentation/pages/verify_account_view.dart';
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
      case registerPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RegisterView(),
        );
      case verifyAccountPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const VerifyAccountView(),
        );
      case forgotPassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPassView(),
        );
      case resetPassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ResetPassView(),
        );
      case changePassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChangePassView(),
        );
      case changePassConfirmationPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChangePassConfirmationView(),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
