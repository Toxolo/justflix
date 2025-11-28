import 'package:flutter/material.dart';
import 'package:justeats/screens/cart_screen.dart';
import 'package:justeats/screens/pizza_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:justeats/presentation/providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PizzaListScreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _onItemTapped(0),
              child: Text(
                'Pizzas',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.blue : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () => _onItemTapped(1),
              child: Badge(
                 label: Text(cartProvider.items.length.toString()),
                 isLabelVisible: cartProvider.items.isNotEmpty,
                child: Text(
                  'Carrito',
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.blue : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
