import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:justeats/presentation/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      body: cartProvider.items.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final pizza = cartProvider.items[index];
                return ListTile(
                   leading: Image.network(
                      'https://pizza-rest-server-production.up.railway.app/${pizza.img}',
                      width: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.local_pizza),
                    ),
                  title: Text(pizza.nom),
                  subtitle: Text('\$${pizza.preu.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      context.read<CartProvider>().remove(pizza);
                    },
                  ),
                  
                );
              },
            ),
      floatingActionButton: cartProvider.items.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                context.read<CartProvider>().clear();
              },
              label: const Text('Limpiar Carrito'),
              icon: const Icon(Icons.delete_forever),
            ),
    );
  }
}
