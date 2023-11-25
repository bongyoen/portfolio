import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/test_bloc/test_bloc.dart';
import '../../bloc/test_bloc/test_event.dart';
import '../../bloc/test_bloc/test_state.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        if (state is TestInitial) {
          context.read<TestBloc>().add(TestAction());
          return const Text("...loading");
        }

        return SizedBox(
          width: 40,
          child: AnimatedCrossFade(
            crossFadeState: context.read<TestBloc>().isOpenMenu
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: TextButton(
              onPressed: () {
                context.read<TestBloc>().add(ChangeHamburgerMenu());
              },
              child: const Icon(Icons.menu),
            ),
            secondChild: TextButton(
              onPressed: () {
                context.read<TestBloc>().add(ChangeHamburgerMenu());
              },
              child: const Icon(Icons.close),
            ),
            duration: const Duration(milliseconds: 200),
          ),
        );
      },
    );
  }
}
