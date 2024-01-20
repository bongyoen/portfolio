import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

import '../../core/utils/app_styles.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: AppPadStyles.p50t80b,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: AppColors.boarderLine, width: 1))),
          constraints: const BoxConstraints(maxWidth: 800),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  List.generate(children.length, (index) => children[index]),
            ),
          ),
        )
      ],
    );
  }
}
