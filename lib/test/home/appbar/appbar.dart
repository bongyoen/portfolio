import 'package:flutter/material.dart';
import 'package:portfolio/test/core/util/app_enums.dart';
import 'package:portfolio/test/core/util/app_extensions.dart';

import 'developerName.dart';
import 'hamburger_menu.dart';
import 'horizontal_header.dart';


class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff181824),
      padding: EdgeInsets.symmetric(
        horizontal: DeviceType.desktop.getHorizontalPadding(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DeveloperName(),
          DeviceType.desktop
              .chkToSize(context, const HamburgerMenu(), const HorizontalHeader())
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}


