import 'package:flutter/material.dart';
import 'package:minimal_ui/main.dart';
import 'package:minimal_ui/services/authentication/authentication_service.dart';
import 'package:minimal_ui/utils/utils.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  void _signOut() {
    final authService = AuthenticationService();
    Utils.showCircularProgressIndicator(context);
    authService.signOut();
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
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
            onTap: _signOut,
            leading: Icon(Icons.logout, color: iconColor,),
            title: Text('LOGOUT', style: textTheme,),
          ),
        ],
      ),
    );
  }
}
