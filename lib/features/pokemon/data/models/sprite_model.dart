import '../../domain/entities/sprite.dart';

class SpriteModel extends Sprite {
  SpriteModel({
    required String front_default,
    required String front_shiny,
    required String back_default,
    required String back_shiny,
  }) : super(
          front_default: front_default,
          front_shiny: front_shiny,
          back_default: back_default,
          back_shiny: back_shiny,
        );

  factory SpriteModel.fromJson(Map<String, dynamic> json) {
    return SpriteModel(
      front_default: json['front_default'],
      front_shiny: json['front_shiny'],
      back_default: json['back_default'],
      back_shiny: json['back_shiny'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'front_default': front_default,
      'front_shiny': front_shiny,
      'back_default': back_default,
      'back_shiny': back_shiny,
    };
  }
}
