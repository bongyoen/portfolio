import 'package:flutter/cupertino.dart';
import 'package:portfolio/test/core/util/app_enums.dart';

extension MediaQueryExtension on BuildContext {
  Size get _size => MediaQuery.of(this).size;

  double get width => _size.width;

  double get height => _size.height;
}

extension DeviceTypeExtension on DeviceType {
  get getMaxWidth => 768;

  Widget chkToSize(BuildContext context, Widget mobil, Widget pc) =>
      context.width < getMaxWidth ? mobil : pc;

  double getHorizontalPadding(BuildContext context) {
    if (context.width < DeviceType.desktop.getMaxWidth) {
      return context.width * .03;
    } else {
      return context.width * .08;
    }
  }

  double getNameWidth(BuildContext context) {
    if (context.width < DeviceType.desktop.getMaxWidth) {
      return context.width * .5;
    } else {
      return context.width * .2;
    }
  }
}
