import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/pokemon_bloc.dart';

import '../../../../../injections.dart';
import 'widgets/body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(child: Text("home"),);
    return BlocProvider(
      create: (_) => locator<PokemonBloc>(),
      child: const Body(),
    );
  }
}