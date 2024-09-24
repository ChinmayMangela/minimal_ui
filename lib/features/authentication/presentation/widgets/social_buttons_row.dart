import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minimal_ui/features/authentication/presentation/widgets/custom_social_button.dart';
import 'package:minimal_ui/services/authentication/authentication_service.dart';
import 'package:minimal_ui/utils/utils.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthenticationService();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialButton(icon: FontAwesomeIcons.google, onButtonTap: () async {
          await authService.signInWithGoogle(context);
        },),
        SizedBox(width: Utils.getScreenWidth(context) * 0.05),
        CustomSocialButton(icon: FontAwesomeIcons.apple, onButtonTap: () {},),
      ],
    );
  }
}
