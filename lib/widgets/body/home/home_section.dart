import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/widgets/body/home/intro_section.dart';
import 'package:portfolio/widgets/cmmn/section_widget.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> serverlessMap = context.read<TestBloc>().severlessMap;

    return const SectionWidget(children: [
      Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: IntroSection(),
          ),
          // SiteMapSection()
        ],
      )
    ]);
  }
}


