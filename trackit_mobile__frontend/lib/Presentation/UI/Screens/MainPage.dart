import 'package:flutter/material.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/CartPage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/HomePage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/Profile.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Widgets/MyBottomNavBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _page = [
    const HomePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _page[_selectedIndex],
    );
  }
}
