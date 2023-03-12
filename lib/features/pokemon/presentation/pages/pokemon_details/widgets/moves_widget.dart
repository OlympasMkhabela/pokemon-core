import 'package:flutter/material.dart';

class MovesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      // {Navigator.of(context).pushNamed(AddressDetailsScreen.routeName)},
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Moves',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'More info',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.grey,
                        )
                      ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
