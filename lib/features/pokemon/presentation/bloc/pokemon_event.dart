part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemons extends PokemonEvent {}

class FetchPokemonDetails extends PokemonEvent {
  final String name;

  FetchPokemonDetails(this.name);
}
