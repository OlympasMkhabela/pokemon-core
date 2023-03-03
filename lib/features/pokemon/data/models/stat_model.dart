import 'dart:convert';

import 'package:pokemon/core/base_info.dart';
import 'package:pokemon/features/pokemon/domain/entities/stat.dart';

class StatModel extends Stat {
  StatModel({
    required int base_stat,
    required int effort,
    required BaseInfo stat,
  }) : super(
          base_stat: base_stat,
          effort: effort,
          stat: stat,
        );

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      base_stat: json['base_stat'],
      effort: json['effort'],
      stat: BaseInfo.fromJson(json['stat']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base_stat': base_stat,
      'effort': effort,
      'stat': jsonEncode(stat),
    };
  }
}
