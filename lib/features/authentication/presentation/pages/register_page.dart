import 'package:flutter/material.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/my_button.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/my_text_field.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/social_buttons_row.dart';
import 'package:minimal_ui/services/authentication/authentication_service.dart';
import 'package:minimal_ui/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.onLoginTap,
  });

  final void Function() onLoginTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _authenticationService = AuthenticationService();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  void _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPassword.text.trim();

    if(password != confirmPassword) {
      Utils.displaySnackBar('Passwords does not match');
      return;
    }


    if(email.isEmpty && password.isEmpty && confirmPassword.isEmpty) {
      Utils.displaySnackBar('Enter your credentials');
      return;
    }

    await _authenticationService.createUserWithEmail(email, password);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassword.dispose();
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
              SizedBox(height: screenHeight * 0.01),
              _buildConfirmPasswordField(),
              SizedBox(height: screenHeight * 0.001),
              _buildForgotPasswordText(),
              SizedBox(height: screenHeight * 0.003),
              MyButton(label: 'Register', onTap: _register),
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
          onPressed: widget.onLoginTap,
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
          'Already have an account??',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        TextButton(
          onPressed: widget.onLoginTap,
          child: Text(
            'Login Here',
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

  Widget _buildConfirmPasswordField() {
    return MyTextField(
      controller: _confirmPassword,
      hintText: 'Confirm Password',
      isPasswordField: true,
      obscureText: obscureConfirmPassword,
      onTogglePasswordVisibility: _toggleConfirmPasswordVisibility,
    );
  }
}
