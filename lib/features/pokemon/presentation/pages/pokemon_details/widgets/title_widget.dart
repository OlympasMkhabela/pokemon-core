import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';

import '../more_info_screen.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(this.details,{super.key});

  final PokemonDetails details;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(MoreInfoScreen.routeName, arguments: details),
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      details.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Row(children: const [
                    Text(
                      'More',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
