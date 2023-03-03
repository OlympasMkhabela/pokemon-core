import 'package:equatable/equatable.dart';
import 'ability.dart';
import 'sprite.dart';
import 'stat.dart';

class PokemonDetails extends Equatable {
  final int id;
  final int order;
  final String name;
  final int weight;
  final int height;
  final int base_experience;
  final List<Ability> abilities;
  final Sprite sprites;
  final List<Stat> stats;

  PokemonDetails(
      {required this.id,
      required this.order,
      required this.name,
      required this.weight,
      required this.height,
      required this.base_experience,
      required this.abilities,
      required this.sprites,
      required this.stats});

  @override
  List<Object?> get props => [
        id,
        order,
        name,
        weight,
        height,
        base_experience,
        abilities,
        sprites,
        stats
      ];
}
