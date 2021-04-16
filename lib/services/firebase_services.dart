import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  Future<QuerySnapshot> getAdminCredentials() {
    final result = FirebaseFirestore.instance.collection('admin').get();
    return result;
  }
}
