import 'package:dartz/dartz.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

import '../../../../core/error/failure.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemons {
  final IPokemonRepository repository;

  GetPokemons(this.repository);

  Future<Either<Failure, Pokemon>> call() async {
    return await repository.getPokemons();
  }
}
