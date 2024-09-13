import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimal_ui/utils/utils.dart';

class AuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> logInWithEmail(String email, String password) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Utils.displaySnackBar(e.message);
    }
    return null;
  }

  Future<UserCredential?> createUserWithEmail(
      String email, String password) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      Utils.displaySnackBar(e.message);
    }
    return null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> sendVerificationEmail() async {
    Utils.displaySnackBar('Email verification has been sent');
    try {
      final user = _firebaseAuth.currentUser;
      await user!.sendEmailVerification();
    } catch (e) {
      Utils.displaySnackBar(e.toString());
    }
  }
}
