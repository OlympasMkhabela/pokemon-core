import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injections.dart';
import '../../bloc/pokemon_bloc.dart';
import 'widgets/body.dart';
import 'widgets/custom_back_button.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  static const routeName = '/pokemon-details';

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  final double _outterPadding = 15;

  Widget buildAppBarAction(
    BuildContext context,
    IconData iconData,
    void Function() onPressed,
  ) {
    return Container(
      width: 50,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.grey.withOpacity(0.5),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Icon(iconData),
      ),
    );
  }

  void _callBack() {}

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          buildAppBarAction(context, Icons.favorite_outline, _callBack),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => locator<PokemonBloc>(),
        child: Body(name),
      ),
    );
  }
}
