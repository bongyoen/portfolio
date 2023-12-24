import 'package:flutter/material.dart';

class WhiteNormalTxt extends StatelessWidget {
  const WhiteNormalTxt(
      {super.key,
      required this.txt,
      required this.size,
      required this.color,
      this.backGroupColor});

  final String txt;
  final double size;
  final Color color;
  final Color? backGroupColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          decorationColor: Colors.red,
          decorationThickness: 6,
          fontSize: size,
          color: color,
          fontStyle: FontStyle.normal,
          height: 1.8,
          backgroundColor: backGroupColor),
    );
  }
}
