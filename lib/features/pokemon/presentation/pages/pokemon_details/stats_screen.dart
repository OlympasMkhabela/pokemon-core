import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/data/models/stat_model.dart';

import 'widgets/info_wapper.dart';

class StatsScreen extends StatelessWidget {
  static const routeName = '/pokemon_details/stats';

  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats =
        ModalRoute.of(context)?.settings.arguments as List<StatModel>;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Stats',
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: ListView.builder(
        itemCount: stats.length,
        itemBuilder: (BuildContext context, int index) {
          return _widget(stats[index]);
        },
      ),
    );
  }

  Widget _widget(StatModel stat) {
    return Column(
      children: [
        InfoWrapper(
          label: 'Base stat',
          text: stat.base_stat.toString(),
        ),
        InfoWrapper(
          label: 'Effort',
          text: stat.effort.toString(),
        ),
        InfoWrapper(
          label: 'Name',
          text: stat.stat.name,
        ),
        InfoWrapper(
          label: 'Url',
          text: stat.stat.url,
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
