import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/bloc/home_bloc/home_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/repogitory/http/dio_http.dart';
import 'package:portfolio/widgets/body/career_section.dart';
import 'package:portfolio/widgets/body/contract_section.dart';
import 'package:portfolio/widgets/body/project_section.dart';

import '../../bloc/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'about_me_section.dart';
import 'home_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _controller = ScrollController();

  final keyArr = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];

  // void _initListenerForInteractWithHeaderIndex() {
  //   double introHeight = keyArr[0].currentContext!.size!.height;
  //   double aboutHeight = keyArr[1].currentContext!.size!.height;
  //   double projectHeight = keyArr[2].currentContext!.size!.height;
  //   double careerHeight = keyArr[3].currentContext!.size!.height;
  //   double contactHeight = keyArr[4].currentContext!.size!.height;
  //
  //   _controller.addListener(() {
  //     double controllerHeight = _controller.offset;
  //
  //     if (_controller.position.extentAfter == 0.0) {
  //       context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(3));
  //     } else if (controllerHeight < introHeight) {
  //       context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(0));
  //     } else if (controllerHeight < (introHeight + aboutHeight)) {
  //       context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(1));
  //     } else if (controllerHeight <
  //         (introHeight + aboutHeight + projectHeight)) {
  //       context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(2));
  //     } else if (controllerHeight <
  //         (introHeight +
  //             aboutHeight +
  //             projectHeight +
  //             careerHeight +
  //             contactHeight)) {
  //       context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(2));
  //     } else {
  //       context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(3));
  //     }
  //   });
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AppBarHeadersIndexChanged) {
          Navigator.of(context).maybePop();
          const duration = Duration(milliseconds: 300);

          Scrollable.ensureVisible(keyArr[state.index].currentContext!,
              duration: duration);
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .08),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  HomeSection(key: keyArr[0]),
                  AboutMeSection(
                    key: keyArr[1],
                  ),
                  ProjectSection(
                    key: keyArr[2],
                  ),
                  CareerSection(
                    key: keyArr[3],
                  ),
                  ContractSection(
                    key: keyArr[4],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
