import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:universal_html/html.dart' as html;

class DeveloperNameBtn extends StatelessWidget {
  const DeveloperNameBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        html.window.location.reload();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          width: context.width < DeviceType.desktop.getMaxWidth()
              ? context.width * .5
              : context.width * .2,
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: Text(
              AppStrings.developerName,
              style: AppStyles.s28,
            ),
          ),
        ),
      ),
    );
  }
}
