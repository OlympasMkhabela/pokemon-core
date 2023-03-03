import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_data_source.dart';

class PokemonRepository implements IPokemonRepository {
  final IPokemonDataSource pokemonDataSource;
  final INetworkInfo networkInfo;

  PokemonRepository({
    required this.pokemonDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Pokemon>> getPokemons() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final pokemons = await pokemonDataSource.getPokemons();
      return Right(pokemons);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonDetails>> getPokemonDetails(String name) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final pokemoneDetails = await pokemonDataSource.getPokemonDetails(name);
      return Right(pokemoneDetails);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
