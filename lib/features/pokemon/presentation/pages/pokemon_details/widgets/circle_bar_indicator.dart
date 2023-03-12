import 'package:flutter/material.dart';

class CircleBarIndicator extends StatelessWidget {
  const CircleBarIndicator(
      {super.key, required this.length, required this.index});

  final int length;
  final int index;

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 9 : 5,
      width: isActive ? 15 : 5,
      decoration: BoxDecoration(
          color: isActive ? Colors.grey : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 35),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < length; i++)
                if (i == index) ...[circleBar(true)] else circleBar(false),
            ],
          ),
        ),
      ],
    );
  }
}
