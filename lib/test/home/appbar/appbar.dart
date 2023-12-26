import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/test/bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/test/bloc/scroll_bloc/home_scroll_state.dart';
import 'package:portfolio/test/core/util/app_enums.dart';
import 'package:portfolio/test/core/util/app_extensions.dart';
import 'package:portfolio/test/core/util/app_style.dart';
import 'package:universal_html/html.dart' as html;

import '../../core/util/app_colors.dart';


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
              .chkToSize(context, HamburgerMenu(), HorizontalHeader())
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class HorizontalHeader extends StatelessWidget {
  const HorizontalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScrollBloc, HomeScrollState>(
      builder: (context, state) {
        if (state is HomeScrollInitial) return Container();

        return Row(
          children: List.generate(
              state.headerNames.length,
              (index) => HeaderBtn(
                    headerIndex: index,
                    headerNames: state.headerNames,
                  )),
        );
      },
    );
  }
}

class HeaderBtn extends StatelessWidget {
  final int headerIndex;
  final List<String> headerNames;

  const HeaderBtn(
      {super.key, required this.headerIndex, required this.headerNames});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
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

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class DeveloperName extends StatelessWidget {
  const DeveloperName({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => html.window.location.reload(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          width: DeviceType.desktop.getNameWidth(context),
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: Text(
              "Beyondi",
              style: AppStyle.ts52w600,
            ),
          ),
        ),
      ),
    );
  }
}
