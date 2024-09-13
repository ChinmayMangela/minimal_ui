import 'package:flutter/material.dart';
import 'package:minimal_ui/common/custom_container.dart';
import 'package:minimal_ui/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return CustomContainer(
                  height: Utils.getScreenHeight(context) * 0.2,
                );
              }),
        )
      ],
    );
  }
}
