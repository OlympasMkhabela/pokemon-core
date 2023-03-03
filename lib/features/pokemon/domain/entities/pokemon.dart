import 'package:equatable/equatable.dart';
import 'package:pokemon/core/base_info.dart';

class Pokemon extends Equatable {
  final int count;
  final String next;
  final List<BaseInfo> results;

  Pokemon({
    required this.count,
    required this.next,
    required this.results,
  });

  @override
  List<Object?> get props => [
        count,
        next,
        results,
      ];
}
