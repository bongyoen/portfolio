import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/app_extensions.dart';

import '../../bloc/scroll_bloc/home_scroll_bloc.dart';
import '../../bloc/scroll_bloc/home_scroll_state.dart';
import 'header_btn.dart';

class VerticalMenuCrossFade extends StatelessWidget {
  const VerticalMenuCrossFade({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScrollBloc, HomeScrollState>(
      builder: (context, state) {
        return AnimatedCrossFade(
            sizeCurve: Curves.bounceInOut,
            alignment: Alignment.topCenter,
            firstChild: Container(),
            secondChild: SizedBox(
              width: context.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  state.headerNames.length,
                      (index) => SizedBox(
                    width: context.width,
                    child: HeaderBtn(
                      headerIndex: index,
                      headerNames: state.headerNames,
                    ),
                  ),
                ),
              ),
            ),
            crossFadeState: state.isOpenMenu
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200));
      },
    );
  }
}
