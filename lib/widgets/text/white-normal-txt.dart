import 'package:flutter/material.dart';

class WhiteNormalTxt extends StatelessWidget {
  const WhiteNormalTxt({super.key, required this.txt, required this.size});

  final String txt;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: size, color: Colors.white, fontStyle: FontStyle.normal, height: 1.8),
    );
  }
}
