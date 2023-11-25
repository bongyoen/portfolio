import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';

import 'header_btn.dart';

class VerticalMenuCrossFade extends StatelessWidget {
  const VerticalMenuCrossFade({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        List<String> headerNames = [];
        if (state is TestApiProvider &&
            DeviceType.desktop.getMaxWidth() > context.width) {
          headerNames = state.headerNames;

          return AnimatedCrossFade(
              sizeCurve: Curves.bounceInOut,
              alignment: Alignment.topCenter,
              firstChild: Container(),
              secondChild: SizedBox(
                width: context.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    headerNames.length,
                    (index) => SizedBox(
                      width: context.width,
                      child: HeaderBtn(
                        headerIndex: index,
                        headerNames: headerNames,
                      ),
                    ),
                  ),
                ),
              ),
              crossFadeState: context.read<TestBloc>().isOpenMenu
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200));
        } else {
          return Container();
        }
      },
    );
  }
}
