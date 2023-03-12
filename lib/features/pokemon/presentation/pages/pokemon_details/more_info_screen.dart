import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_details_model.dart';

import 'widgets/info_wapper.dart';

class MoreInfoScreen extends StatelessWidget {
  static const routeName = '/pokemon_details/more_info';

  const MoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final details =
        ModalRoute.of(context)?.settings.arguments as PokemonDetailsModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          details.name,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: _body(details),
    );
  }

  Widget _body(PokemonDetailsModel details) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InfoWrapper(
            label: 'Id',
            text: details.id.toString(),
          ),
          const Divider(
            height: 1,
          ),
          InfoWrapper(
            label: 'Order',
            text: details.order.toString(),
          ),
          const Divider(
            height: 1,
          ),
          InfoWrapper(
            label: 'Name',
            text: details.name,
          ),
          const Divider(
            height: 1,
          ),
          InfoWrapper(
            label: 'Weight',
            text: details.weight.toString(),
          ),
          const Divider(
            height: 1,
          ),
          InfoWrapper(
            label: 'Height',
            text: details.height.toString(),
          ),
          const Divider(
            height: 1,
          ),
          InfoWrapper(
            label: 'Base experience',
            text: details.base_experience.toString(),
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
