import 'package:flutter/material.dart';

import 'app_enums.dart';

extension AppBarHeaderExtension on AppBarHeaders {
  String getString() {
    switch (this) {
      case AppBarHeaders.home:
        return 'Home';
      case AppBarHeaders.aboutMe:
        return 'About me';
      case AppBarHeaders.career:
        return 'Career';
      case AppBarHeaders.contact:
        return 'Contact';
    }
  }
}

extension MediaQueryExtension on BuildContext {
  Size get _size => MediaQuery.of(this).size;
  double get width => _size.width;
  double get height => _size.height;
}

enum DeviceType { desktop }

extension DeviceTypeExtension on DeviceType {
  int getMaxWidth() {
    return 768;
  }

  Widget deviceType(BuildContext context, Widget mobile, Widget desktop) {
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