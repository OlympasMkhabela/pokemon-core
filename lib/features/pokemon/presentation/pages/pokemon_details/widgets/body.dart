import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/domain/entities/sprite.dart';

import '../../../bloc/pokemon_bloc.dart';
import '../../../widgets/loading_widget.dart';
import 'circle_bar_indicator.dart';
import 'stats_widget.dart';
import 'moves_widget.dart';
import 'abilities_widget.dart';
import 'title_widget.dart';

class Body extends StatefulWidget {
  final String name;

  Body(
    this.name, {
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentImagePage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case Initial:
            BlocProvider.of<PokemonBloc>(context)
                .add(FetchPokemonDetails(widget.name));
            return const LoadingWidget();
          case Loading:
            return const LoadingWidget();
          case Error:
            break;
          case PokemonDetailsLoaded:
            return _loadedStateHandler(state as PokemonDetailsLoaded);
          default:
            break;
        }

        return Placeholder();
      },
    );
  }

  Widget _loadedStateHandler(PokemonDetailsLoaded state) {
    final images = _buildImages(state.details.sprites);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 500,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PageView.builder(
                  onPageChanged: (page) => _onPageChange(page),
                  itemCount: images.length,
                  itemBuilder: (context, index) => images[index],
                ),
                CircleBarIndicator(
                  index: currentImagePage,
                  length: images.length,
                )
              ],
            ),
          ),
          Column(
            children: [
              const Divider(
                height: 1,
              ),
              TitleWidget(state.details),
              const Divider(height: 1),
              MovesWidget(),
              const Divider(height: 1),
              AbilitiesWidget(state.details.abilities),
              const Divider(height: 1),
              StatsWidget(state.details.stats),
              const Divider(height: 1),
            ],
          )
        ],
      ),
    );
  }

  List<Image> _buildImages(Sprite sprite) {
    return [
      sprite.front_default,
      sprite.back_default,
      sprite.front_shiny,
      sprite.back_shiny,
    ]
        .map((url) => Image.network(
              url,
              fit: BoxFit.cover,
            ))
        .toList();
  }

  void _onPageChange(int page) {
    currentImagePage = page;
    setState(() {});
  }
}
