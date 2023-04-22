import 'package:flutter_bubble_tea_app/components/drink_tile.dart';
import 'package:flutter_bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';
import 'order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OrderPage(drink: drink)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                'Bubble Tea Shop',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              // list of drinks for sale
              Expanded(
                child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      Drink individualDrink = value.shop[index];
                      return Column(
                        children: [
                          DrinkTile(
                              trailing: const Icon(Icons.arrow_forward),
                              drink: individualDrink,
                              onTap: () => goToOrderPage(individualDrink)),
                          const SizedBox(height: 10)
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
