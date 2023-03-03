// Mocks generated by Mockito 5.3.2 from annotations
// in pokemon/test/features/pokemon/domain/usecases/get_pokemon_details_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pokemon/core/error/failure.dart' as _i5;
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart' as _i6;
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart'
    as _i7;
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IPokemonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPokemonRepository extends _i1.Mock
    implements _i3.IPokemonRepository {
  MockIPokemonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Pokemon>> getPokemons() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Pokemon>>.value(
            _FakeEither_0<_i5.Failure, _i6.Pokemon>(
          this,
          Invocation.method(
            #getPokemons,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Pokemon>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.PokemonDetails>> getPokemonDetails(
          String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonDetails,
          [name],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i7.PokemonDetails>>.value(
                _FakeEither_0<_i5.Failure, _i7.PokemonDetails>(
          this,
          Invocation.method(
            #getPokemonDetails,
            [name],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i7.PokemonDetails>>);
}
