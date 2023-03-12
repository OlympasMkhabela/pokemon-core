import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/domain/entities/stat.dart';

import '../stats_screen.dart';


class StatsWidget extends StatelessWidget {
  const StatsWidget(this.stats, {super.key});

  final List<Stat> stats;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(StatsScreen.routeName, arguments: stats)
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Stats',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${stats.length}',
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    const Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
