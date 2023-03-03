part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonsEvent extends PokemonEvent {}

class GetPokemonDetailsEvent extends PokemonEvent {
  final String name;

  GetPokemonDetailsEvent(this.name);
}
