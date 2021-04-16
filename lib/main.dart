import 'package:flutter/material.dart';
import 'package:grocery_dashboard/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Admin',
      theme: ThemeData(
        primaryColor: Color(0xff84c225),
      ),
      initialRoute: Routes.login,
      onGenerateRoute: RouteApp.generateRoute,
    );
  }
}
