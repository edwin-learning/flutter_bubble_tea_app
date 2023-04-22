import 'package:flutter_bubble_tea_app/components/drink_tile.dart';
import 'package:flutter_bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
           const Text(
                'Cart',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                  Drink drink = value.cart[index];
                  return Column(
                    children: [
                      DrinkTile(
                        drink: drink,
                        onTap: () {
                          removeFromCart(drink);
                        },
                        trailing: const Icon(Icons.delete),
                      ),
                      const  SizedBox(height: 10)
                    ],
                  );
                 
                },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
