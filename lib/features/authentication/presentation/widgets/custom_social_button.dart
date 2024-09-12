import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.icon,
    required this.onButtonTap,
  });

  final IconData icon;
  final void Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Icon(icon, size: 35,),
        ),
      ),
    );
  }
}
