import 'package:flutter/material.dart';
import 'package:minimal_ui/common/custom_container.dart';
import 'package:minimal_ui/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return CustomContainer(
        height: Utils.getScreenHeight(context) * 0.25,
        width: Utils.getScreenWidth(context),
      );
    });
  }
}
