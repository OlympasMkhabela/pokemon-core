import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/pokemon_details.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonDetails {
  final IPokemonRepository repository;

  GetPokemonDetails(this.repository);

  Future<Either<Failure, PokemonDetails>> call(String name) async {
    return await repository.getPokemonDetails(name);
  }
}
