import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:justeats/domain/entities/pizza.dart';

abstract class PizzaRemoteDataSource {
  Future<List<Pizza>> getPizzas();
}

class PizzaRemoteDataSourceImpl implements PizzaRemoteDataSource {
  final http.Client client;

  PizzaRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Pizza>> getPizzas() async {
    final response = await client.get(Uri.parse('http://10.0.2.2:8080/api/pizzes'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Pizza.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pizzas');
    }
  }
}
