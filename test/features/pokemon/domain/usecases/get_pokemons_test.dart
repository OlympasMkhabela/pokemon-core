import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/core/base_info.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_pokemons.dart';

import 'get_pokemons_test.mocks.dart';

@GenerateMocks([IPokemonRepository])
void main() {
  late MockIPokemonRepository repository;
  late GetPokemons usecase;

  setUp(() {
    repository = MockIPokemonRepository();
    usecase = GetPokemons(repository);
  });

  final pokemon = PokemonModel(
    count: 200,
    next: "test next",
    results: [
      BaseInfo(name: 'name1', url: 'url1'),
      BaseInfo(name: 'name2', url: 'url2'),
      BaseInfo(name: 'name3', url: 'url3'),
    ],
  );

  test(
    'should get top 100 pokemons',
    () async {
      // arrange
      when(repository.getPokemons()).thenAnswer((_) async => Right(pokemon));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(pokemon));
      verify(repository.getPokemons());
      verifyNoMoreInteractions(repository);
    },
  );
}
