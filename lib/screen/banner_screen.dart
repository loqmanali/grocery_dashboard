import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:grocery_dashboard/componant/banner_upload_widget.dart';
import 'package:grocery_dashboard/componant/banner_widget.dart';
import 'package:grocery_dashboard/services/sidebar.dart';

import '../app_routes.dart';

class BannerScreen extends StatelessWidget {
  final SideBarWidget _sideBar = SideBarWidget();

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Grocery Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      sideBar: _sideBar.sideBarMenu(context, Routes.banner),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Banners',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              Text('Add / Delete Home Screen Banner Images'),
              Divider(thickness: 5.0),
              BannerWidget(),
              Divider(thickness: 5.0),
              BannerUploadWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
