import 'package:flutter/material.dart';
import 'package:minimal_ui/services/authentication/authentication_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthenticationService();
    final iconColor = Theme.of(context).colorScheme.tertiary;
    final textTheme = Theme.of(context).textTheme.labelMedium!.copyWith(
      color: iconColor,
    );
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon((Icons.person), color: iconColor, size: 100,),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.info, color: iconColor,),
            title: Text('ABOUT', style: textTheme),
          ),
          ListTile(
            onTap: () {
              authService.signOut();
            },
            leading: Icon(Icons.logout, color: iconColor,),
            title: Text('LOGOUT', style: textTheme,),
          ),
        ],
      ),
    );
  }
}
