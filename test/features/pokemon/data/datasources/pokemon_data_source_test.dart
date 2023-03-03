import 'dart:convert';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/core/error/exceptions.dart';
import 'package:pokemon/features/pokemon/data/datasources/pokemon_data_source.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_details_model.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'pokemon_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
@GenerateMocks([PokemonDataSource])
void main() {
  late MockPokemonDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MockPokemonDataSource();
  });

  group('getPokemons', () {
    final pokemon =
        PokemonModel.fromJson(json.decode(fixture('pokemon_list.json')));

    test(
      'should return Pokemon when the response code is 200 (success)',
      () async {
        // arrange
        when(dataSource.getPokemons()).thenAnswer((_) async => pokemon);
        // act
        final result = await dataSource.getPokemons();
        // assert
        expect(result, equals(pokemon));
      },
    );

    // test(
    //   'should throw a ServerException when the request fails',
    //   () async {
    //     // arrange
    //     when(dataSource.getPokemons()).thenAnswer((_) async => pokemon);
    //     // act
    //     final call = dataSource.getPokemons;
    //     // assert
    //     expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    //   },
    // );
  });

  group('getPokemonDetails', () {
    final pokemonName = 'test';
    final pokemonDetails = PokemonDetailsModel.fromJson(
        json.decode(fixture('pokemon_details.json')));

    test(
      'should return PokemonDetails when the response code is 200 (success)',
      () async {
        // arrange
        when(dataSource.getPokemonDetails(any))
            .thenAnswer((_) async => pokemonDetails);
        // act
        final result = dataSource.getPokemonDetails(pokemonName);
        // assert
        verify(dataSource.getPokemonDetails(pokemonName),
        );
      },
    );

    //   test(
    //     'should throw a ServerException when the request fails',
    //     () async {
    //       // arrange
    //       setUpMockHttpClientFailure404();
    //       // act
    //       final call = dataSource.getPokemonDetails;
    //       // assert
    //       expect(
    //           () => call(pokemonName), throwsA(TypeMatcher<ServerException>()));
    //     },
    //   );
  });
}
