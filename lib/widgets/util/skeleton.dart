import 'package:flutter/material.dart';

class Skeletron extends StatelessWidget {
  const Skeletron({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromRGBO(240, 240, 240, 1)
      ),
    );
  }

}