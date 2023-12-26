import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/test/core/util/app_style.dart';

import '../../bloc/scroll_bloc/home_scroll_bloc.dart';
import '../../bloc/scroll_bloc/home_scroll_event.dart';
import '../../core/util/app_colors.dart';

class HeaderBtn extends StatelessWidget {
  final int headerIndex;
  final List<String> headerNames;

  const HeaderBtn(
      {super.key, required this.headerIndex, required this.headerNames});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<HomeScrollBloc>().add(ChangeHeaderIndex(index: headerIndex, context: context));

        },
        style: TextButton.styleFrom(
            textStyle: AppStyle.ts16w600,
            backgroundColor: AppColors.appBarColor,
            foregroundColor: _getHeaderColor(
                currentIndex: context.read<HomeScrollBloc>().appBarHeaderIndex,
                headerIndex: headerIndex)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 26,
          ),
          child: Text(
            headerNames[headerIndex],
          ),
        ));
  }

  Color _getHeaderColor({required currentIndex, required int headerIndex}) =>
      currentIndex == headerIndex ? AppColors.primaryColor : AppColors.white;
}
