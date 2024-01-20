import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';

import '../../../bloc/board_bloc/board_bloc.dart';
import '../../../bloc/board_bloc/board_state.dart';
import '../../cmmn/section_widget.dart';
import '../../cmmn/title_widget.dart';
import 'career_box.dart';

class CareerSection extends StatelessWidget {
  const CareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      children: [
        const TitleText(title: AppStrings.carrer),
        Text(AppStrings.carrerTxt1, style: AppTxtStyles.s25black),
        Text(AppStrings.carrerTxt2, style: AppTxtStyles.s35black),
        SizedBox(
          child: BlocBuilder<BoardBloc, BoardState>(
            builder: (context, state) {
              if (state is! BoardInitial && state.crc001List.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(state.crc001List.length, (index) {
                    return CareerBox(
                      crc001Item: state.crc001List[index],
                    );
                  }),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(7, (index) {
                    return Column(
                      children: AppLoadStyle.sktH30P12t,
                    );
                  }),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
