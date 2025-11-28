import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:justeats/presentation/providers/pizza_provider.dart';
import 'package:justeats/presentation/providers/cart_provider.dart';

class PizzaListScreen extends StatelessWidget {
  const PizzaListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PizzaProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.pizzas.length,
            itemBuilder: (context, index) {
              final pizza = provider.pizzas[index];
              return GestureDetector(
                onTap: () {
                  context.read<CartProvider>().add(pizza);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${pizza.nom} añadida al carrito'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(pizza.nom),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //Per a que estiga al principi
                      children: [
                        Text(pizza.desc),
                        if (pizza.vegetariana)
                          const Text(
                            '%100VEGANA',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                    trailing: Image.network(
                      'https://pizza-rest-server-production.up.railway.app/${pizza.img}',
                      width: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.local_pizza),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}