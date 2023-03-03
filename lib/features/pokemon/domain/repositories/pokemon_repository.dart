import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/pokemon.dart';
import '../entities/pokemon_details.dart';

abstract class IPokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemons();
  Future<Either<Failure, PokemonDetails>> getPokemonDetails(String name);
}
