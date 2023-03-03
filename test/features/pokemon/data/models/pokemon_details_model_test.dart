import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/core/base_info.dart';
import 'package:pokemon/features/pokemon/data/models/ability_model.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_details_model.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/features/pokemon/data/models/sprite_model.dart';
import 'package:pokemon/features/pokemon/data/models/stat_model.dart';
import 'package:pokemon/features/pokemon/domain/entities/ability.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/entities/sprite.dart';
import 'package:pokemon/features/pokemon/domain/entities/stat.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final pokemonDetailsModel = PokemonDetailsModel(
      id: 1,
      order: 1,
      name: "bulbasaur",
      weight: 69,
      height: 7,
      base_experience: 64,
      abilities: [
        AbilityModel(
          ability: BaseInfo(
            name: "overgrow",
            url: "https://pokeapi.co/api/v2/ability/65/",
          ),
          is_hidden: false,
          slot: 1,
        ),
        AbilityModel(
          ability: BaseInfo(
            name: "chlorophyll",
            url: "https://pokeapi.co/api/v2/ability/34/",
          ),
          is_hidden: true,
          slot: 3,
        ),
      ],
      sprites: SpriteModel(
        back_default:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
        back_shiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png",
        front_default:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
        front_shiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png",
      ),
      stats: [
        StatModel(
          base_stat: 45,
          effort: 0,
          stat: BaseInfo(
            name: "hp",
            url: "https://pokeapi.co/api/v2/stat/1/",
          ),
        ),
        StatModel(
          base_stat: 49,
          effort: 0,
          stat: BaseInfo(
            name: "attack",
            url: "https://pokeapi.co/api/v2/stat/2/",
          ),
        ),
      ]);

  test(
    'should be a subclass of PokemonDetails entity',
    () async {
      // assert
      expect(pokemonDetailsModel, isA<PokemonDetails>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when parsed to JSON',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('pokemon_details_test.json'));
        // act
        final result = PokemonDetailsModel.fromJson(jsonMap);
        // assert
        expect(result, pokemonDetailsModel);
      },
    );
  });

  // group('toJson', () {
  //   test(
  //     'should return a JSON map containing the proper data',
  //     () async {
  //       // act
  //       final result = pokemonDetailsModel.toJson();
  //       // assert
  //       final expectedMap =
  //           json.decode(fixture('pokemon_details_expected.json'));
  //       expect(result, expectedMap);
  //     },
  //   );
  // });
}
