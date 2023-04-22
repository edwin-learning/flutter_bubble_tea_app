import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyBottomBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.grey[300],
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 8,
        tabs: const [
          //shop tab
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          //cart tab
          GButton(
            icon: Icons.shopping_bag,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
