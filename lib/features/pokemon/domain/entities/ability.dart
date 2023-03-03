import 'package:equatable/equatable.dart';
import '../../../../core/base_info.dart';

class Ability extends Equatable {
  final BaseInfo ability;
  final bool is_hidden;
  final int slot;

  Ability({required this.ability, required this.is_hidden, required this.slot});

  @override
  List<Object?> get props => [ability, is_hidden, slot];
}
