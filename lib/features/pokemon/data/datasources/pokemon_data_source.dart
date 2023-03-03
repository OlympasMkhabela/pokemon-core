import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/pokemon_details_model.dart';
import '../models/pokemon_model.dart';

abstract class IPokemonDataSource {
  /// Calls the https://pokeapi.co/api/v2/pokemon endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PokemonModel> getPokemons();

  /// Calls the https://pokeapi.co/api/v2/pokemon/{name} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PokemonDetailsModel> getPokemonDetails(String name);
}

class PokemonDataSource implements IPokemonDataSource {
  final http.Client client;

  PokemonDataSource({required this.client});

  @override
  Future<PokemonModel> getPokemons() async {
    final result = await _getPokemonDataFromUrl(
        'https://pokeapi.co/api/v2/pokemon?limit=100');
    return PokemonModel.fromJson(json.decode(result));
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetails(String name) async {
    final result =
        await _getPokemonDataFromUrl('https://pokeapi.co/api/v2/pokemon/$name');
    return PokemonDetailsModel.fromJson(json.decode(result));
  }

  List<PokemonModel> _parsePokemons(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<PokemonModel>((json) => PokemonModel.fromJson(json))
        .toList();
  }

  Future<String> _getPokemonDataFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }
}
