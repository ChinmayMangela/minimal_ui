import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:minimal_ui/features/authentication/data/user_repository.dart';
import 'package:minimal_ui/utils/utils.dart';

class AuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _userRepository = UserRepository();

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

      await _userRepository.addUserToFireStore(email);

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

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      // this opens the google sign in interface for user
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // this line indicates that the sign in process is not cancelled if its null then user cancelled the process
      if (googleUser != null) {
        // if user signs in successfully this method retrieves authentication details such ad accessToken and idToken
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
        _userRepository.addUserToFireStore(googleUser.email);

      } else {
        Utils.displaySnackBar('Google sign-in cancelled');
        return null;
      }
    } on FirebaseAuthException catch (e) {
      Utils.displaySnackBar(e.message);
    }
    return null;
  }

}
