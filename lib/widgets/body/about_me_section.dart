import 'package:flutter/material.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

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

            const WhiteNormalTxt(
                txt: "안녕하세요! 저는 플스텍 웹개발자로서 서울에서 활동하고 있는 김봉연입니다.\n"
                    "저는 웹사이트와 응용프로그램 개발에 관심이 많으며, 객체지향 프로그래밍을 선호합니다.\n"
                    "시스템의 구성과 workflow, 방법론, 디자인패턴 등을 중요하게 생각하며,\n"
                    "이를 바탕으로 새로운 프레임워크와 언어를 학습하고 적용하고 있습니다.",
                size: 20,
                color: Colors.white),
            LogoSection(
              items: bearItem,
            )
          ],
        ),
      ),
    );
  }
}
