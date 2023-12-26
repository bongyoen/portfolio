import 'package:flutter/cupertino.dart';

import '../../../core/util/app_style.dart';

class HowMakePart extends StatelessWidget {
  const HowMakePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        "How can I make a portfolio?",
        style: AppStyle.ts50w600,
      ),
    );
  }
}