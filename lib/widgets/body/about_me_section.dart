import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

import '../../bloc/board_bloc/board_bloc.dart';
import '../../bloc/board_bloc/board_event.dart';
import '../../bloc/board_bloc/board_state.dart';
import 'logo_section.dart';

final bearItem = [
  {"image": "assets/img/jira.png", "name": "JIRA"},
  {"image": "assets/img/react.png", "name": "REACT"},
  {"image": "assets/img/angular.png", "name": "ANGULRA"},
  {"image": "assets/img/aws.png", "name": "AWS"},
  {"image": "assets/img/electron.png", "name": "ELECTRON"},
  {"image": "assets/img/flutter.png", "name": "FLUTTER"},
  {"image": "assets/img/git.png", "name": "GIT"},
  {"image": "assets/img/mariadb.png", "name": "MARIA"},
  {"image": "assets/img/redmine.png", "name": "REDMINE"},
  {"image": "assets/img/typescript.png", "name": "TS"},
  {"image": "assets/img/mysql.png", "name": "MYSQL"},
];

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WhiteNormalTxt(
                txt: "About Me", size: 60, color: Colors.deepPurpleAccent),
            BlocBuilder<BoardBloc, BoardState>(
              builder: (context, state) {
                if (state is! BoardInitial && state.amc001List.isNotEmpty) {
                  return WhiteNormalTxt(
                      txt: state.amc001List[0].boardRsltDtls[0].boardDtlTxt,
                      size: 20,
                      color: Colors.white);
                } else {
                  context.read<BoardBloc>().add(GetAMC001Action());
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(height: 12),
                      ]);
                }
              },
            ),
            LogoSection(
              items: bearItem,
            )
          ],
        ),
      ),
    );
  }
}
