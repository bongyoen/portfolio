import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';

import '../../../bloc/board_bloc/board_bloc.dart';
import '../../../bloc/board_bloc/board_state.dart';
import '../../../model/board_rslt_dtl.dart';
import '../../cmmn/section_widget.dart';
import '../../cmmn/title_widget.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      children: [
        const TitleText(title: AppStrings.aboutMeTitle),
        BlocBuilder<BoardBloc, BoardState>(
          builder: (context, state) {
            if (state is! BoardInitial && state.amc001List.isNotEmpty) {
              List<BoardRsltDtl> dtlList = state.amc001List[0].boardRsltDtls;
              return Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  children: List.generate(
                      dtlList.length,
                      (index) => Text(
                            dtlList[index].boardDtlTxt,
                            style: AppTxtStyles.s15black,
                          )),
                ),
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
      ],
    );
  }
}
