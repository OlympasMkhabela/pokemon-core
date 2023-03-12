import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/pokemon_bloc.dart';

import 'favorite_item.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case Initial:
            break;
          case Loading:
            break;
          case Error:
            break;
          case PokemonLoaded:
            return _loadedStateHandler(state as PokemonLoaded);
          default:
            break;
        }

        return Placeholder();
      },
    );
    // return ListView.builder(
    //   itemCount: 1,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ;
    //   },
    // ),
    //   return ListView(
    //       padding: const EdgeInsets.only(top: 3),
    //       children: dummyActivities
    //           .map((e) => FavoriteItem(
    //               id: e.id,
    //               title: e.title,
    //               imageUrl: e.images[0],
    //               ratings: e.rating,
    //               reviews: e.reviews,
    //               categories: ['categories']))
    //           .toList());
  }

  _loadedStateHandler(PokemonLoaded state) {
    return ListView.builder(
          itemCount: state.pokemon.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Placeholder();
          },
        );
  }
}
