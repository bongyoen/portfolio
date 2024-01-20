import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/skill_bloc/skill_bloc.dart';
import 'package:portfolio/bloc/skill_bloc/skill_state.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/image_enum.dart';
import 'package:portfolio/core/utils/stateful_wrapper.dart';

import '../../../bloc/skill_bloc/skill_event.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({super.key, required this.skill});

  final SkillSectionEnum skill;

  @override
  Widget build(BuildContext context) {
    SkillBloc bloc = context.read<SkillBloc>();
    double boxWidth = 90;
    double boxHeight = 90;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatefulWrapper(
            onInit: () {
              skill.getSkills().forEach(
                  (element) => bloc.add(GetSkillImgEvent(imageInfos: element)));
            },
            child: Container()),
        BlocBuilder<SkillBloc, SkillState>(
          builder: (context, state) {
            if (state is! SkillImageState) {
              return Row(
                children: List.generate(7, (_) => AppLoadStyle.sktH100W100P10r),
              );
            }

            return Wrap(
              children: List.generate(skill.getSkills().length, (index) {
                List<ImageInfos> list = skill.getSkills();

                if (state.map[list[index].getName()] == null) {
                  return skillBoxPadding(Container(
                    color: Colors.grey,
                    width: boxWidth,
                    height: boxHeight,
                  ));
                }

                return skillBoxPadding(Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      state.map[list[index].getName()]!,
                      width: boxWidth,
                      height: boxHeight,
                    ),
                    Text(list[index].getName())
                  ],
                ));
                // return Container();
              }),
            );
          },
        ),
      ],
    );
  }
}

Widget skillBoxPadding(Widget child) {
  return Padding(
    padding: AppPadStyles.p10t15r25b,
    child: child,
  );
}
