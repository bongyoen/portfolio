import 'package:flutter/material.dart';
import 'package:portfolio/bloc/home_bloc/home_bloc.dart';
import 'package:portfolio/bloc/home_bloc/home_event.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors.dart';

class HeaderBtn extends StatelessWidget {
  const HeaderBtn({super.key, required this.headerIndex});

  final int headerIndex;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(headerIndex));
        },
        style: TextButton.styleFrom(
            textStyle: AppStyles.s16,
            foregroundColor: _getHeaderColor(
                currentIndex: context.read<HomeBloc>().appBarHeaderIndex,
                headerIndex: headerIndex)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 26,
          ),
          child: Text(
            AppBarHeaders.values[headerIndex].getString(),
          ),
        ));
  }

  Color _getHeaderColor({required currentIndex, required int headerIndex}) {
    if (currentIndex == headerIndex) {
      return AppColors.primaryColor;
    } else {
      return AppColors.white;
    }
  }
}
