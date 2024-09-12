import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
    this.obscureText = false,
    this.onTogglePasswordVisibility,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final bool obscureText;
  final void Function()? onTogglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme
            .of(context)
            .colorScheme
            .primary,
      ),
      borderRadius: BorderRadius.circular(4),
    );
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: isPasswordField
              ? IconButton(onPressed: onTogglePasswordVisibility, icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme
                .of(context)
                .colorScheme
                .tertiary,
          ),)
              : null,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.grey.shade400,
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: Theme
          .of(context)
          .colorScheme
          .primary,
      enabledBorder: outlineBorder,
      border: outlineBorder,
      focusedBorder: outlineBorder,
    ),);
  }
}
