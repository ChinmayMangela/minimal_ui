import 'package:flutter/material.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/my_button.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/my_text_field.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/social_buttons_row.dart';
import 'package:minimal_ui/main.dart';
import 'package:minimal_ui/services/authentication/authentication_service.dart';
import 'package:minimal_ui/utils/utils.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({
    super.key,
    required this.onRegisterTap,
  });

  final void Function() onRegisterTap;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authenticationService = AuthenticationService();

  bool obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if(email.isEmpty || password.isEmpty) {
      Utils.displaySnackBar('Enter your credentials');
      return;
    }

    Utils.showCircularProgressIndicator(context);
    await _authenticationService.logInWithEmail(email, password);
    navigatorKey.currentState?.popUntil((route) => route.isFirst);

  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final screenHeight = Utils.getScreenHeight(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(),
              SizedBox(height: screenHeight * 0.06),
              _buildHeadingTitle(),
              SizedBox(height: screenHeight * 0.03),
              _buildEmailField(),
              SizedBox(height: screenHeight * 0.01),
              _buildPasswordField(),
              SizedBox(height: screenHeight * 0.001),
              _buildForgotPasswordText(),
              SizedBox(height: screenHeight * 0.003),
              MyButton(label: 'Log In', onTap: _login),
              SizedBox(height: screenHeight * 0.03),
              _buildOrContinueWithText(),
              SizedBox(height: screenHeight * 0.03),
              const SocialButtonsRow(),
              SizedBox(height: screenHeight * 0.014),
              _buildBottomRowMessage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      Icons.lock,
      color: Theme.of(context).colorScheme.secondary,
      size: 100,
    );
  }

  Widget _buildHeadingTitle() {
    return Text(
      'Welcome back you\'ve been missed!',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
    );
  }

  Widget _buildForgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: widget.onRegisterTap,
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrContinueWithText() {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Theme.of(context).colorScheme.tertiary,
        )),
        Text(
          '  Or continue with  ',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        Expanded(
            child: Divider(
          color: Theme.of(context).colorScheme.tertiary,
        ))
      ],
    );
  }

  Widget _buildBottomRowMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not have an account??',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        TextButton(
          onPressed: widget.onRegisterTap,
          child: Text(
            'Register Now',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return MyTextField(
      controller: _emailController,
      hintText: 'Email',
    );
  }

  Widget _buildPasswordField() {
    return MyTextField(
      controller: _passwordController,
      hintText: 'Password',
      isPasswordField: true,
      obscureText: obscurePassword,
      onTogglePasswordVisibility: _togglePasswordVisibility,
    );
  }
}
