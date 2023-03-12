import 'package:flutter/material.dart';
import 'package:pokemon/core/base_info.dart';

import '../../pokemon_details/pokemon_detail_screen.dart';

class PokemonItem extends StatelessWidget {
  final BaseInfo info;
  const PokemonItem(this.info, {super.key});

  void _selectItem(BuildContext context) => Navigator.of(context)
      .pushNamed(PokemonDetailsScreen.routeName, arguments: info.name);

  String _getImageUrl() {
    String _id = info.url.split('v2/pokemon/')[1].replaceAll('/', '');
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_id}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        GridTile(
          header: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 35,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => {},
                  child: Icon(
                    Icons.favorite_outline_outlined,
                  ),
                ),
              ),
            ],
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            margin: const EdgeInsets.all(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => _selectItem(context),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                _getImageUrl(),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Text(info.name),
        ),
      ],
    );
  }
}
