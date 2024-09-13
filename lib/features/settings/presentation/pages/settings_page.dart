import 'package:flutter/material.dart';
import 'package:minimal_ui/common/custom_container.dart';
import 'package:minimal_ui/utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return CustomContainer(
        height: Utils.getScreenHeight(context) * 0.16,
        width: Utils.getScreenWidth(context),
      );
    });
  }
}
