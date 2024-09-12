import 'package:flutter/material.dart';
import 'package:minimal_ui/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return _buildContainer(context);
    });
  }


  Widget _buildContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: double.infinity,
      height: Utils.getScreenHeight(context) * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
