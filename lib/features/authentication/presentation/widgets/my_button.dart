import 'package:flutter/material.dart';
import 'package:minimal_ui/utils/utils.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Utils.getScreenHeight(context) * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
           color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: Text(label, style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),),
        ),
      ),
    );
  }
}
