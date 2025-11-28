import 'package:flutter/material.dart';
import 'package:justeats/domain/entities/pizza.dart';

class CartProvider extends ChangeNotifier {
  final List<Pizza> _items = [];

  List<Pizza> get items => _items;

  void add(Pizza pizza) {
    _items.add(pizza);
    notifyListeners();
  }

  void remove(Pizza pizza) {
    _items.remove(pizza);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
