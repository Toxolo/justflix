import 'package:flutter/material.dart';
import 'package:justeats/domain/entities/pizza.dart';
import 'package:justeats/domain/usecases/get_pizzas.dart';

class PizzaProvider extends ChangeNotifier {
  final GetPizzas getPizzas;
  List<Pizza> _pizzas = [];
  bool _isLoading = false;

  PizzaProvider({required this.getPizzas});

  List<Pizza> get pizzas => _pizzas;
  bool get isLoading => _isLoading;

  Future<void> fetchPizzas() async {
    _isLoading = true;
    notifyListeners();
    try {
      _pizzas = await getPizzas();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
