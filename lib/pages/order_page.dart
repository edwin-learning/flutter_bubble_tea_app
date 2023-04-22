import 'package:flutter_bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double iceValue = 0.5;
  double bubbleValue = 0.5;
  double sweetValue = 0.5;
  void customizeSweet(double NewValue) {
    setState(() {
      sweetValue = NewValue;
    });
  }

  void customizeIce(double NewValue) {
    setState(() {
      iceValue = NewValue;
    });
  }

  void customizeBubble(double NewValue) {
    setState(() {
      bubbleValue = NewValue;
    });
  }

  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(context: context, builder: (context) => const AlertDialog(
      title: Text('Successfully added to cart'),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      body: Column(
        children: [
          Image.asset(widget.drink.imagePath),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 100, child: Text('Sweet')),
                    Expanded(
                      child: Slider(
                          value: sweetValue,
                          label: sweetValue.toString(),
                          onChanged: (value) {
                            customizeSweet(value);
                          }),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 100, child: Text('Ice')),
                    Expanded(
                      child: Slider(
                          value: iceValue,
                          label: iceValue.toString(),
                          onChanged: (value) {
                            customizeIce(value);
                          }),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 100, child: Text('Pearls')),
                    Expanded(
                      child: Slider(
                          value: bubbleValue,
                          label: bubbleValue.toString(),
                          onChanged: (value) {
                            customizeBubble(value);
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
          MaterialButton(
            color: Colors.brown,
            onPressed: 
              () {
                addToCart();
              },
            
            child: const Text(
              'Add to cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
