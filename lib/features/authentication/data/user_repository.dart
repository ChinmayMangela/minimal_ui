
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minimal_ui/utils/utils.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserToFireStore(String email) async {
    try {
      final CollectionReference users = _firestore.collection('users');
      await users.add({
        'email': email,
      });
    } catch (e) {
      Utils.displaySnackBar(e.toString());
    }
  }
}