import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/features/pokemon/domain/usecases/get_pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_pokemons.dart';

import 'core/network/network_info.dart';
import 'features/pokemon/data/datasources/pokemon_data_source.dart';
import 'features/pokemon/data/repositories/pokemon_repository.dart';
import 'features/pokemon/domain/repositories/pokemon_repository.dart';

import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! Features - Pokemon
  // Bloc
  locator.registerFactory(
    () => PokemonBloc(
      getPokemonDetails: locator(),
      getPokemons: locator(),
    ),
  );

  // Use cases
  locator.registerLazySingleton(() => GetPokemons(locator()));
  locator.registerLazySingleton(() => GetPokemonDetails(locator()));

  // Repository
  locator.registerLazySingleton<IPokemonRepository>(
    () => PokemonRepository(
      pokemonDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<IPokemonDataSource>(
    () => PokemonDataSource(client: locator()),
  );

  //! Core
  locator.registerLazySingleton<INetworkInfo>(() => NetworkInfo(locator()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
