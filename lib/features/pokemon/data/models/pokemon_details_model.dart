import 'dart:convert';

import 'package:pokemon/features/pokemon/data/models/ability_model.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/entities/sprite.dart';
import 'package:pokemon/features/pokemon/domain/entities/stat.dart';

import '../../domain/entities/ability.dart';
import 'sprite_model.dart';
import 'stat_model.dart';

class PokemonDetailsModel extends PokemonDetails {
  PokemonDetailsModel(
      {required int id,
      required int order,
      required String name,
      required int weight,
      required int height,
      required int base_experience,
      required List<Ability> abilities,
      required Sprite sprites,
      required List<Stat> stats})
      : super(
            id: id,
            name: name,
            order: order,
            weight: weight,
            height: height,
            base_experience: base_experience,
            abilities: abilities,
            sprites: sprites,
            stats: stats);

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    final sprites = json['sprites'];
    final spritesm = json['abilities']
        .map<AbilityModel>((json) => AbilityModel.fromJson(json))
        .toList();

    return PokemonDetailsModel(
      id: json['id'],
      name: json['name'],
      order: json['order'],
      weight: json['weight'],
      height: json['height'],
      base_experience: (json['base_experience'] as num).toInt(),
      abilities: json['abilities']
          .map<AbilityModel>((json) => AbilityModel.fromJson(json))
          .toList(),
      sprites: SpriteModel.fromJson(json['sprites']),
      stats: json['stats']
          .map<StatModel>((json) => StatModel.fromJson(json))
          .toList(),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'order': order,
  //     'weight': weight,
  //     'height': height,
  //     'base_experience': base_experience,
  //     'abilities': jsonEncode((abilities as AbilityModel).toJson()),
  //     'sprites': jsonEncode(sprites),
  //     'stats': jsonEncode(stats),
  //   };
  // }
}
