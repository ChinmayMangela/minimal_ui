import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimal_ui/utils/utils.dart';

class AuthenticationService {

  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> logInWithEmail(String email, String password) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      Utils.displaySnackBar(e.message);
    }
    return null;
  }

  Future<UserCredential?> createUserWithEmail(String email, String password) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      Utils.displaySnackBar(e.message);
    }
    return null;
  }
}