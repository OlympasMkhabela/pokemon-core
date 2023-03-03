import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/core/base_info.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final pokemonModel = PokemonModel(
    count: 1279,
    next: "https://pokeapi.co/api/v2/pokemon?offset=100&limit=100",
    results: [
      BaseInfo(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      BaseInfo(name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
      BaseInfo(name: 'venusaur', url: 'https://pokeapi.co/api/v2/pokemon/3/'),
    ],
  );

  test(
    'should be a subclass of Pokemon entity',
    () async {
      // assert
      expect(pokemonModel, isA<Pokemon>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when parsed to JSON',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('pokemon_list.json'));
        // act
        final result = PokemonModel.fromJson(jsonMap);
        // assert
        expect(result, pokemonModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = pokemonModel.toJson();
        // assert
        final expectedMap = {
          "count": 1279,
          "next": "https://pokeapi.co/api/v2/pokemon?offset=100&limit=100",
          "results":
              '[{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"},{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon/2/"},{"name":"venusaur","url":"https://pokeapi.co/api/v2/pokemon/3/"}]'
        };
        expect(result, expectedMap);
      },
    );
  });
}
