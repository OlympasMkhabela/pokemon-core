import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';

import 'package:pokemon/features/pokemon/domain/usecases/get_pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_pokemons.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemons getPokemons;
  final GetPokemonDetails getPokemonDetails;

  PokemonBloc({
    required this.getPokemons,
    required this.getPokemonDetails,
  }) : super(Initial()) {
    on<GetPokemonsEvent>(_onGetPokemons);
    on<GetPokemonDetailsEvent>(_onGetPokemonDetails);
  }

  Future<void> _onGetPokemons(
    GetPokemonsEvent event,
    Emitter<PokemonState> emit,
  ) async {
    emit(Loading());
    final result = await getPokemons();
    emit(
      result.fold(
        (failure) => Error(message: 'message'),
        (pokemon) => PokemonLoaded(pokemon),
      ),
    );
  }

  Future<void> _onGetPokemonDetails(
    GetPokemonDetailsEvent event,
    Emitter<PokemonState> emit,
  ) async {
    emit(Loading());

    final result = await getPokemonDetails(event.name);
    emit(
      result.fold(
        (failure) => Error(message: 'message'),
        (pokemonDetails) => PokemonDetailsLoaded(pokemonDetails),
      ),
    );
  }
}
