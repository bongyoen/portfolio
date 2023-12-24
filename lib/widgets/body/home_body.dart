import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/body/career_section.dart';
import 'package:portfolio/widgets/body/contract_section.dart';

import '../app_bar/vertical_menu_cross_fade.dart';
import 'about_me_section.dart';
import 'home_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   context
    //       .read<HomeScrollBloc>()
    //       .add(ChangeScrollAxis(controller: controller));
    // });
  }

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
  }
}
