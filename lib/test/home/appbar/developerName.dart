import 'package:flutter/material.dart';
import 'package:portfolio/test/core/util/app_enums.dart';
import 'package:portfolio/test/core/util/app_extensions.dart';
import 'package:portfolio/test/core/util/app_style.dart';
import 'package:universal_html/html.dart' as html;

class DeveloperName extends StatelessWidget {
  const DeveloperName({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => html.window.location.reload(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          width: DeviceType.desktop.getNameWidth(context),
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: Text(
              "Beyondi",
              style: AppStyle.ts52w600,
            ),
          ),
        ),
      ),
    );
  }
}