import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WhiteNormalTxt(txt: "안녕하세요 저는", size: 25),
                  Row(children: [
                    WhiteNormalTxt(txt: "김봉연", size: 40),
                    WhiteNormalTxt(txt: " 이라고 합니다", size: 15)
                  ]),
                  WhiteNormalTxt(txt: "웹을 만드는 개발자입니다.", size: 15)
                ],
              ),
              Text("homeImage")
            ],
          ),
          WhiteNormalTxt(txt: "How Make This Portfolio?", size: 50)
        ],
      ),
    );
  }
}
