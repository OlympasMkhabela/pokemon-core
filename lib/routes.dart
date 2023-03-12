import 'package:flutter/material.dart';

import 'core/navigation/navigation_screen.dart';
import 'features/pokemon/presentation/pages/favorites/favorites_screen.dart';
import 'features/pokemon/presentation/pages/home/home_screen.dart';
import 'features/pokemon/presentation/pages/pokemon_details/abilities_screen.dart';
import 'features/pokemon/presentation/pages/pokemon_details/more_info_screen.dart';
import 'features/pokemon/presentation/pages/pokemon_details/pokemon_detail_screen.dart';
import 'features/pokemon/presentation/pages/pokemon_details/stats_screen.dart';


final Map<String, WidgetBuilder> routes = {
  NavigationScreen.routeName: (_) => NavigationScreen(),
  HomeScreen.routeName: (_) => HomeScreen(),
  FavoritesScreen.routeName: (_) => FavoritesScreen(),
  PokemonDetailsScreen.routeName: (_) => PokemonDetailsScreen(),
  AbilitiesScreen.routeName: (_) => AbilitiesScreen(),
  MoreInfoScreen.routeName: (_) => MoreInfoScreen(),
  StatsScreen.routeName: (_) => StatsScreen(),
};
