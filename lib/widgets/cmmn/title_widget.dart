import 'package:flutter/material.dart';

import '../../core/utils/app_styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: AppPadStyles.p10t10b,child: Text(
      title,
      style: AppTxtStyles.s60orange,
    ),);
  }
}
