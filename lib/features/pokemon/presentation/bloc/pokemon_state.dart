part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class Initial extends PokemonState {}

class Loading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final Pokemon pokemon;

  PokemonLoaded(this.pokemon);
}

class PokemonDetailsLoaded extends PokemonState {
  final PokemonDetails details;

  PokemonDetailsLoaded(this.details);
}

class Error extends PokemonState {
  final String message;

  Error({required this.message});
}
