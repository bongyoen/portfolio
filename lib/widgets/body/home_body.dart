import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/body/career_section.dart';
import 'package:portfolio/widgets/body/contract_section.dart';

import '../../bloc/test_bloc/test_event.dart';
import '../app_bar/vertical_menu_cross_fade.dart';
import 'about_me_section.dart';
import 'home_section.dart';

var isFirst = false;

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    controller.addListener(() {
      context.read<TestBloc>().add(ChangeScrollAxis(controller: controller));
    });

    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        return Stack(
          children: [
            _loadingWidget(
                controller: controller, state: state, context: context)
          ],
        );
      },
    );
  }

  Widget _loadingWidget(
      {required ScrollController controller,
      required TestState state,
      required BuildContext context}) {
    if (state is TestApiProvider) {
      return Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .08),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  HomeSection(key: state.headerNameKeys[0]),
                  AboutMeSection(key: state.headerNameKeys[1]),
                  CareerSection(key: state.headerNameKeys[2]),
                  ContractSection(key: state.headerNameKeys[3]),
                ],
              ),
            ),
          ),
          const VerticalMenuCrossFade()
        ],
      );
    } else {
      return Container();
    }
  }
}
