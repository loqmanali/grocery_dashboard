import 'package:flutter/material.dart';
import 'package:grocery_dashboard/screen/admin_users.dart';
import 'package:grocery_dashboard/screen/category_screen.dart';
import 'package:grocery_dashboard/screen/notifications_screen.dart';
import 'package:grocery_dashboard/screen/orders_screen.dart';
import 'package:grocery_dashboard/screen/setting_screen.dart';

import 'screen/banner_screen.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/vendor_screen.dart';

class RouteApp {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.banner:
        return MaterialPageRoute(builder: (context) => BannerScreen());
      case Routes.category:
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      case Routes.orders:
        return MaterialPageRoute(builder: (context) => OrdersScreen());
      case Routes.notifications:
        return MaterialPageRoute(builder: (context) => NotificationsScreen());
      case Routes.adminUsers:
        return MaterialPageRoute(builder: (context) => AdminUsersScreen());
      case Routes.setting:
        return MaterialPageRoute(builder: (context) => SettingScreen());
      case Routes.vendor:
        return MaterialPageRoute(builder: (context) => VendorScreen());
      default:
        return null;
    }
  }
}

class Routes {
  static const String home = 'home';
  static const String login = 'login';
  static const String banner = 'banner';
  static const String category = 'category';
  static const String orders = 'orders';
  static const String notifications = 'notifications';
  static const String adminUsers = 'adminUsers';
  static const String setting = 'setting';
  static const String vendor = 'vendor';
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
