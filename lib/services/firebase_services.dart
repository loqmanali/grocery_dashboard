import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  Future<DocumentSnapshot> getAdminCredentials(id) {
    final result = FirebaseFirestore.instance.collection('admin').doc(id).get();
    return result;
  }
}
