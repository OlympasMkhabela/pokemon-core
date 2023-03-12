import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.ratings,
      required this.reviews,
      required this.categories});

  final String id;
  final String title;
  final String imageUrl;
  final double ratings;
  final int reviews;
  final List<String> categories;

  void _selectItem(BuildContext context) {
    // Navigator.of(context)
    //     .pushNamed(ActivityDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => _selectItem(context),
          child: Container(
            height: 85,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 8,bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                height: double.infinity,
                width: 70,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    imageUrl,
                    height: 50,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        title,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    // Row(
                    //   children: categories.map((category) => TextContainer(category)).toList(),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$ratings ',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const Center(
                            child: Icon(
                              size: 16,
                              Icons.star,
                              color: Colors.grey,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          Text(
                            '  ($reviews)',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      const Divider(height: 1,)
      ],
    );
  }
}
