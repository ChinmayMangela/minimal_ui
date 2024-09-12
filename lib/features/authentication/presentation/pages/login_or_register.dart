import 'package:flutter/material.dart';
import 'package:minimal_ui/features/authentication/presentation/pages/log_in_page.dart';
import 'package:minimal_ui/features/authentication/presentation/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;

  void _toggleState() {
    setState(() {
      showLogin = !showLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showLogin ? LogInPage(
      onRegisterTap: _toggleState,
    ) : RegisterPage(
      onLoginTap: _toggleState,
    );
  }
}
