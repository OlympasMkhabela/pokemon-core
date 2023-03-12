import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/pokemon_bloc.dart';
import '../../../widgets/loading_widget.dart';
import 'pokemon_item.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case Initial:
            BlocProvider.of<PokemonBloc>(context).add(FetchPokemons());
            return const LoadingWidget();
          case Loading:
            return const LoadingWidget();
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

  }

  _loadedStateHandler(PokemonLoaded state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: state.pokemon.results.length,
      itemBuilder: (BuildContext context, int index) {
        return PokemonItem(state.pokemon.results[index]);
      },
    );
  }
}
