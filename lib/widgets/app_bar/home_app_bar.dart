import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/app_bar/developer_name_btn.dart';
import 'package:portfolio/widgets/app_bar/horizontal_header.dart';

import '../../core/utils/app_colors.dart';
import 'hamburger_menu.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.appBarColor,
        padding: EdgeInsets.symmetric(
          horizontal: DeviceType.desktop.getHorizontalPadding(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DeveloperNameBtn(),
            DeviceType.desktop.deviceType(
                context, const HamburgerMenu(), const HorizontalHeader())
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
