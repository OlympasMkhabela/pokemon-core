import 'dart:convert';

import 'package:pokemon/core/base_info.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required int count,
    required String next,
    required List<BaseInfo> results,
  }) : super(count: count, next: next, results: results);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      count: json['count'],
      next: json['next'],
      results: json['results']
          .map<BaseInfo>((json) => BaseInfo.fromJson(json))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'results': jsonEncode(results),
    };
  }
}
