import 'package:flutter/material.dart';
import 'package:portfolio/widgets/body/home/intro_section.dart';
import 'package:portfolio/widgets/cmmn/section_widget.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {

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


