import 'package:flutter/material.dart';

class InfoWrapper extends StatelessWidget {
  const InfoWrapper({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
