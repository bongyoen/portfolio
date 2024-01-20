import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/body/contract/contract_section.dart';
import 'package:portfolio/widgets/body/skill/skill_section.dart';

import '../../bloc/scroll_bloc/home_scroll_event.dart';
import '../../core/utils/stateful_wrapper.dart';
import '../app_bar/vertical_menu_cross_fade.dart';
import 'about_me/about_me_section.dart';
import 'career/career_section.dart';
import 'home/home_section.dart';
import 'map/map_section.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScrollBloc, HomeScrollState>(
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
      required HomeScrollState state,
      required BuildContext context}) {
    if (state is HomeScrollInitial) return Container();

    HomeScrollBloc bloc = context.read<HomeScrollBloc>();
    return Stack(
      children: [
        StatefulWrapper(
          onInit: () => controller.addListener(
              () => bloc.add(ChangeScrollAxis(controller: controller))),
          child: Container(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .08),
          child: SingleChildScrollView(
            controller: controller,
            child: SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  HomeSection(key: state.headerNameKeys[0]),
                  AboutMeSection(key: state.headerNameKeys[1]),
                  SkillSection(key: state.headerNameKeys[2]),
                  CareerSection(key: state.headerNameKeys[3]),
                  MapSection(key: state.headerNameKeys[4]),
                  ContractSection(key: state.headerNameKeys[5]),
                ],
              ),
            ),
          ),
        ),
        const VerticalMenuCrossFade()
      ],
    );
  }
}
