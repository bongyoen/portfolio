import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/home_bloc.dart';
import 'package:portfolio/bloc/test_bloc/home_state.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/image_enum.dart';
import 'package:portfolio/widgets/body/skill/skill_box.dart';

import '../../cmmn/section_widget.dart';
import '../../cmmn/title_widget.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      children: [
        const TitleText(title: AppStrings.skill),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            const skills = SkillSectionEnum.values;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(skills.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: AppPadStyles.p10t),
                    fillColorText(
                      const Color.fromARGB(50, 255, 153, 051),
                      skills[index].name,
                      30,
                    ),
                    SkillBox(skill: skills[index])
                  ],
                );
              }),
            );
          },
        )
      ],
    );
  }
}

Widget fillColorText(Color? fillColor, String txt, double? size) {
  return Container(
    decoration: BoxDecoration(
      color: fillColor,
    ),
    child: Text(
      txt,
      style: TextStyle(fontSize: size),
    ),
  );
}
