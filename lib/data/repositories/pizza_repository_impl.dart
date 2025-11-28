import 'package:justeats/data/datasources/pizza_remote_data_source.dart';
import 'package:justeats/domain/entities/pizza.dart';
import 'package:justeats/domain/repositories/pizza_repository.dart';

class PizzaRepositoryImpl implements PizzaRepository {
  final PizzaRemoteDataSource remoteDataSource;

  PizzaRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Pizza>> getPizzas() {
    return remoteDataSource.getPizzas();
  }
}
