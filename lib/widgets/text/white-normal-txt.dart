import 'package:flutter/material.dart';

class WhiteNormalTxt extends StatelessWidget {
  const WhiteNormalTxt({super.key, required this.txt, required this.size, required this.color});

  final String txt;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: size, color: color, fontStyle: FontStyle.normal, height: 1.8),
    );
  }
}
