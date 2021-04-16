import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/login_screen.dart';

class RouteApp {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return null;
    }
  }
}

class Routes {
  static const String home = 'home';
  static const String login = 'login';
}

class AppNavigator {
  static void navigatorTo(BuildContext context, bool back, Widget widget) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => widget);
    if (back) {
      Navigator.of(context).push(route);
    } else {
      Navigator.of(context).pushReplacement(route);
    }
  }
}
