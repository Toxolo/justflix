import 'package:justeats/domain/entities/pizza.dart';

abstract class PizzaRepository {
  Future<List<Pizza>> getPizzas();
}
