import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GNav(
        color: Colors.grey[800],
        padding: EdgeInsets.all(20),
        tabMargin: EdgeInsets.symmetric(horizontal: 20),
        activeColor: Color.fromRGBO(138, 58, 58, 1),
        tabActiveBorder: Border.all(color: Color.fromRGBO(116, 48, 48, 1)),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.person,
            text: 'Person',
          ),
        ],
      ),
    );
  }
}
