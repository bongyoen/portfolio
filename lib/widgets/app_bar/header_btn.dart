import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/app_styles.dart';

import '../../bloc/scroll_bloc/home_scroll_bloc.dart';
import '../../bloc/scroll_bloc/home_scroll_event.dart';
import '../../core/utils/app_colors.dart';

class HeaderBtn extends StatelessWidget {
  const HeaderBtn(
      {super.key, required this.headerIndex, required this.headerNames});

  final int headerIndex;
  final List<String> headerNames;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context
              .read<HomeScrollBloc>()
              .add(ChangeHeaderIndex(index: headerIndex, context: context));
        },
        style: TextButton.styleFrom(
            textStyle: AppStyles.s16,
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
