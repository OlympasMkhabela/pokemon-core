import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  void _onTap(BuildContext context) {
    // showSearch(context: context, delegate: ActivitySearch());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: InkWell(
        
        onTap: () => _onTap(context),
        child: Row(children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          Text('Search')
        ]),
      ),

      // child: TextField(
      //   onTap:() => _onTap(context),
      //   decoration: const InputDecoration(
      //       border: InputBorder.none,
      //       focusedBorder: InputBorder.none,
      //       enabledBorder: InputBorder.none,
      //       hintText: "Search",
      //       prefixIcon: Icon(Icons.search)),
      // ),
    );
  }
}
