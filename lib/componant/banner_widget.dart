import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_dashboard/services/firebase_services.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseServices _services = FirebaseServices();

    return StreamBuilder<QuerySnapshot>(
      stream: _services.banners.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return Container(
          width: MediaQuery.of(context).size.width,
          height: 300.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return Stack(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Card(
                      elevation: 10.0,
                      child: Image.network(document.data()['image']),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _services.confirmDeleteDialog(
                            context: context,
                            message: 'Are you sure you want to delete?',
                            title: 'Delete Banner',
                            id: document.id,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
