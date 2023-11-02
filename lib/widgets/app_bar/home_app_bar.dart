import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/app_bar/developer_name_btn.dart';
import 'package:portfolio/widgets/app_bar/header.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_enums.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.appBarColor,
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(context),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [DeveloperNameBtn(), Header()],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);

  double _getHorizontalPadding(BuildContext context) {
    if (context.width < DeviceType.ipad.getMaxWidth()) {
      return context.width * .03;
    } else {
      return context.width * .08;
    }
  }
}