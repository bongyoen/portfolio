import 'package:flutter/cupertino.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteNormalTxt(txt: "About Me", size: 60)
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteNormalTxt(
                  txt: "안녕하세요! 서울에 거주하는 플스텍 웹개발자 김봉연입니다.\n"
                      "저는 웹사이트와 때론 응용프로그램을 개발합니다.\n"
                      "객체지향을 추구하며, 시스템의 구성과 workflow, 방법론, 디자인패턴 등을 항상 고민합니다.\n"
                      "이런 바탕으로 새로운 프레임워크와 언어를 공부하며 일하고 있습니다.",
                  size: 20)
            ],
          ),
        ],
      ),
    );
  }
}
