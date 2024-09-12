import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/custom_social_button.dart';
import 'package:minimal_ui/utils/utils.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialButton(icon: FontAwesomeIcons.google, onButtonTap: () {},),
        SizedBox(width: Utils.getScreenWidth(context) * 0.05),
        CustomSocialButton(icon: FontAwesomeIcons.apple, onButtonTap: () {},),
      ],
    );
  }
}
