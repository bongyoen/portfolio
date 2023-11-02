import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_extensions.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: context.height * 12),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("homeText"),
        Text("homeImage")
      ],
    ),
    );
  }

}