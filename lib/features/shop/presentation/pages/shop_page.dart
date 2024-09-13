import 'package:flutter/material.dart';
import 'package:minimal_ui/common/custom_container.dart';
import 'package:minimal_ui/utils/utils.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return CustomContainer(height: Utils.getScreenHeight(context) * 0.2);
      },
    );
  }
}
