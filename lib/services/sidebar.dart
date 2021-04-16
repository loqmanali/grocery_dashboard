import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../app_routes.dart';

class SideBarWidget {
  sideBarMenu(context, selectedRoute) {
    return SideBar(
      activeBackgroundColor: Colors.black45,
      activeIconColor: Colors.white,
      activeTextStyle: TextStyle(color: Colors.white),
      textStyle: TextStyle(color: Colors.black),
      items: const [
        MenuItem(
          title: 'Dashboard',
          route: Routes.home,
          icon: Icons.dashboard,
        ),
        MenuItem(
          title: 'Banners',
          route: Routes.banner,
          icon: CupertinoIcons.photo_fill_on_rectangle_fill,
        ),
        MenuItem(
          title: 'Category',
          route: Routes.category,
          icon: Icons.category_rounded,
        ),
        MenuItem(
          title: 'Orders',
          route: Routes.orders,
          icon: CupertinoIcons.cart_fill,
        ),
        MenuItem(
          title: 'Send Notification',
          route: Routes.notifications,
          icon: Icons.notifications,
        ),
        MenuItem(
          title: 'Admin Users',
          route: Routes.adminUsers,
          icon: Icons.person_rounded,
        ),
        MenuItem(
          title: 'Setting',
          route: Routes.setting,
          icon: Icons.settings_applications,
        ),
        MenuItem(
          title: 'Exit',
          route: '/',
          icon: Icons.exit_to_app_rounded,
        ),
      ],
      selectedRoute: selectedRoute,
      onSelected: (item) {
        Navigator.of(context).pushNamed(item.route);
      },
      header: Container(
        height: 50,
        width: double.infinity,
        color: Colors.black26,
        child: Center(
          child: Text(
            'Menu',
            style: TextStyle(color: Colors.white, letterSpacing: 2.0),
          ),
        ),
      ),
      footer: Container(
        height: 50,
        width: double.infinity,
        color: Colors.black26,
        child: Center(
          child: Text(
            'footer',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
