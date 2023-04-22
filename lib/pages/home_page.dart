import 'package:flutter_bubble_tea_app/components/bottom_nav_bar.dart';
import 'package:flutter_bubble_tea_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
// navigate bottom bar
void navigateBottomBar(int NewIndex) {
  setState(() {
    _selectedIndex = NewIndex;
  });
}
// pages to display
final List<Widget> _pages = [
  const ShopPage(),
  const CartPage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar: MyBottomBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
