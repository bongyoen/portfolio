import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_bloc.dart';

import '../../bloc/scroll_bloc/home_scroll_event.dart';
import '../../bloc/scroll_bloc/home_scroll_state.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScrollBloc, HomeScrollState>(
      builder: (context, state) {
        if (state is ChangeScrollState) {
          return SizedBox(
            width: 40,
            child: AnimatedCrossFade(
              crossFadeState: context.read<HomeScrollBloc>().isOpenMenu
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: TextButton(
                onPressed: () {
                  context.read<HomeScrollBloc>().add(ChangeHamburgerMenu());
                },
                child: const Icon(Icons.menu),
              ),
              secondChild: TextButton(
                onPressed: () {
                  context.read<HomeScrollBloc>().add(ChangeHamburgerMenu());
                },
                child: const Icon(Icons.close),
              ),
              duration: const Duration(milliseconds: 200),
            ),
          );
        }
        return Container();
      },
    );
  }
}
