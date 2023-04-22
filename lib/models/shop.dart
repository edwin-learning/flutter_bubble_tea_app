import 'package:flutter_bubble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    // pearl mil tea
    Drink(name: "Pearl", price: '5\$', imagePath: 'lib/images/milk_tea.png'),
    Drink(
        name: "Black Milk", price: '3\$', imagePath: 'lib/images/milk_tea.png'),
    Drink(
        name: "Red Dragon", price: '4\$', imagePath: 'lib/images/milk_tea.png'),
    Drink(
        name: "White Pearl",
        price: '2\$',
        imagePath: 'lib/images/milk_tea.png'),
    Drink(name: "Milky", price: '3\$', imagePath: 'lib/images/milk_tea.png')
  ];

  // list of drinks in user cart
  final List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get user cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

// remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
