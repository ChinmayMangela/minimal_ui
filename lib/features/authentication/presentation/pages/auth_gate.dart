import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_ui/features/authentication/presentation/pages/login_or_register.dart';
import 'package:minimal_ui/features/home/presentation/pages/home_page.dart';
import 'package:minimal_ui/tabs.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasData) {
        return const Tabs();
      } else {
        return const LoginOrRegister();
      }
    });
  }
}
