import 'package:justeats/domain/entities/pizza.dart';
import 'package:justeats/domain/repositories/pizza_repository.dart';

class GetPizzas {
  final PizzaRepository repository;

  GetPizzas(this.repository);

  Future<List<Pizza>> call() {
    return repository.getPizzas();
  }
}
