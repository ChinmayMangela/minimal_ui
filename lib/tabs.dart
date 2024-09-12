import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:minimal_ui/common/my_drawer.dart';
import 'package:minimal_ui/features/home/presentation/pages/home_page.dart';
import 'package:minimal_ui/features/profile/presentation/pages/profile_page.dart';
import 'package:minimal_ui/features/settings/presentation/pages/settings_page.dart';
import 'package:minimal_ui/features/shop/presentation/pages/shop_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Widget> _pages = const [
    HomePage(),
    ShopPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  var selectedIndex = 0;

  void _onPageSelect(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APP'),
      ),
      drawer: const MyDrawer(),
      body: _pages[selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return GNav(
        selectedIndex: selectedIndex,
        onTabChange: _onPageSelect,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(icon: Icons.shop, text: 'Shop'),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ]);
  }
}
