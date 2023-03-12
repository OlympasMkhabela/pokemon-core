import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key,
      this.foregroundColor = Colors.black,
      this.backgroundColor = Colors.white});

  final Color foregroundColor;
  final Color backgroundColor;

  void onPressedCallBack(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.grey.withOpacity(0.5),
          padding: EdgeInsets.zero,
        ),
        onPressed: () => onPressedCallBack(context),
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}
