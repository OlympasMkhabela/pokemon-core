import 'package:equatable/equatable.dart';
import '../../../../core/base_info.dart';

class Stat extends Equatable {
  final int base_stat;
  final int effort;
  final BaseInfo stat;

  Stat({required this.base_stat, required this.effort, required this.stat});

  @override
  List<Object?> get props => [base_stat, effort, stat];
}
