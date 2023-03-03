import 'dart:convert';

import 'package:pokemon/core/base_info.dart';
import 'package:pokemon/features/pokemon/domain/entities/ability.dart';

class AbilityModel extends Ability {
  AbilityModel({
    required int slot,
    required bool is_hidden,
    required BaseInfo ability,
  }) : super(
          slot: slot,
          is_hidden: is_hidden,
          ability: ability,
        );

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      slot: json['slot'],
      is_hidden: json['is_hidden'],
      ability: BaseInfo.fromJson(json['ability']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot': slot,
      'is_hidden': is_hidden,
      'ability': jsonEncode(ability),
    };
  }
}
