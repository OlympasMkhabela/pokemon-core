import 'package:equatable/equatable.dart';

class Sprite extends Equatable {
  final String front_default;
  final String front_shiny;
  final String back_default;
  final String back_shiny;

  Sprite({
    required this.front_default,
    required this.front_shiny,
    required this.back_default,
    required this.back_shiny,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [front_default, front_shiny, back_default, back_shiny];
}
