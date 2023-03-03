import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/core/base_info.dart';
import 'package:pokemon/features/pokemon/domain/entities/ability.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/entities/sprite.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_pokemon_details.dart';

import 'get_pokemons_test.mocks.dart';

@GenerateMocks([IPokemonRepository])
void main() {
  late MockIPokemonRepository repository;
  late GetPokemonDetails usecase;

  setUp(() {
    repository = MockIPokemonRepository();
    usecase = GetPokemonDetails(repository);
  });

  const pokemonName = 'test';
  final pokemonDetails = PokemonDetails(
    id: 1,
    order: 1,
    name: 'test',
    weight: 34,
    height: 54,
    base_experience: 45,
    abilities: [
      Ability(
          ability: BaseInfo(
            name: '',
            url: '',
          ),
          is_hidden: false,
          slot: 1),
    ],
    sprites: Sprite(
      back_default: '',
      back_shiny: '',
      front_default: '',
      front_shiny: '',
    ),
    stats: const [],
  );

  test(
    'should get pokemon details',
    () async {
      // arrange
      when(repository.getPokemonDetails(pokemonName))
          .thenAnswer((_) async => Right(pokemonDetails));

      // act
      final result = await usecase(pokemonName);

      // assert
      expect(result, Right(pokemonDetails));
      verify(repository.getPokemonDetails(pokemonName));
      verifyNoMoreInteractions(repository);
    },
  );
}
