import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:grocery_dashboard/componant/vendor_data_table.dart';
import 'package:grocery_dashboard/componant/vendor_filter.dart';
import 'package:grocery_dashboard/services/sidebar.dart';

import '../app_routes.dart';

class VendorScreen extends StatelessWidget {
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
      sideBar: _sideBar.sideBarMenu(context, Routes.orders),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Vendor',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Manage all the Vendor activites',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Divider(thickness: 5.0),
              VendorFilter(),
              Divider(thickness: 5.0),
              VendorDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}
