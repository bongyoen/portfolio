import 'package:flutter/cupertino.dart';
import 'package:portfolio/core/utils/app_extensions.dart';

enum DeviceType { desktop }

extension DeviceTypeExtension on DeviceType {
  int getMaxWidth() {
    return 768;
  }

  Widget widthType(BuildContext context, Widget mobile, Widget desktop) {
    return context.width < 768 ? mobile : desktop;
  }

  double getHorizontalPadding(BuildContext context) {
    if (context.width < DeviceType.desktop.getMaxWidth()) {
      return context.width * .03;
    } else {
      return context.width * .08;
    }
  }
}