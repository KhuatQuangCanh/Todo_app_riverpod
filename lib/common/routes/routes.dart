import 'package:flutter/material.dart';
import 'package:todo_app_reverpod/features/auth/pages/login_page.dart';
import 'package:todo_app_reverpod/features/auth/pages/otp_page.dart';
import 'package:todo_app_reverpod/features/onboarding/pages/onboarding.dart';
import 'package:todo_app_reverpod/features/todo/pages/homepage.dart';

class Routes {
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String otp = 'otp';
  static const String home = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (context) => const OnBoarding());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) =>
            OtpPage(
              smsCodeId: args['smsCodeId'],
              phone: args['phone'],));
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
        
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
