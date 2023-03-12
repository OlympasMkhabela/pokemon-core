import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/data/models/ability_model.dart';

import 'widgets/info_wapper.dart';

class AbilitiesScreen extends StatelessWidget {
  static const routeName = '/pokemon_details/abilities';

  const AbilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final abilities =
        ModalRoute.of(context)?.settings.arguments as List<AbilityModel>;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Abilities',
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: ListView.builder(
        itemCount: abilities.length,
        itemBuilder: (BuildContext context, int index) {
          return _widget(abilities[index]);
        },
      ),
    );
  }

  Widget _widget(AbilityModel ability) {
    return Column(
      children: [
        InfoWrapper(
          label: 'Slot',
          text: ability.slot.toString(),
        ),
        InfoWrapper(
          label: 'Name',
          text: ability.ability.name,
        ),
        InfoWrapper(
          label: 'Url',
          text: ability.ability.url,
        ),
        InfoWrapper(
          label: 'Is hidden',
          text: ability.is_hidden.toString(),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
