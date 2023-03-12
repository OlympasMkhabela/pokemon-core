import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/domain/entities/ability.dart';

import '../abilities_screen.dart';

class AbilitiesWidget extends StatelessWidget {
  const AbilitiesWidget(
    this.abilities, {
    super.key,
  });

  final List<Ability> abilities;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(
          AbilitiesScreen.routeName,
          arguments: abilities,
        )
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
              'Abilities',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  '${abilities.length}',
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
