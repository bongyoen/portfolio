import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/test/bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/test/bloc/scroll_bloc/home_scroll_state.dart';
import 'package:portfolio/test/core/util/app_extensions.dart';
import 'package:portfolio/test/home/body/about_section/about_section.dart';
import 'package:portfolio/test/home/body/career_section/career_section.dart';
import 'package:portfolio/test/home/body/contract_section/contract_section.dart';
import 'package:portfolio/test/home/body/main_section/main_section.dart';

import '../../bloc/scroll_bloc/home_scroll_event.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = context.read<HomeScrollBloc>().controller;

    if (!controller.hasListeners) {
      controller.addListener(
          () => context.read<HomeScrollBloc>().add(ChangeScrollAxis()));
    }

    return BlocBuilder<HomeScrollBloc, HomeScrollState>(
      builder: (context, state) {

        if(state is HomeScrollInitial) return Container();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .08),
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                MainSection(key: state.headerNameKeys[0]),
                AboutSection(key: state.headerNameKeys[1]),
                CareerSection(key: state.headerNameKeys[2]),
                ContractSection(key: state.headerNameKeys[3]),
                const SizedBox(
                  width: double.infinity,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
