import 'package:flutter/material.dart';

import '../text/white-normal-txt.dart';

class CareerSection extends StatelessWidget {
  const CareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhiteNormalTxt(
                txt: "Carrer", size: 60, color: Colors.deepPurpleAccent),
            WhiteNormalTxt(txt: "다양한 경험과 지식", size: 25, color: Colors.white),
            WhiteNormalTxt(txt: "DB, 프레임워크, 서버", size: 35, color: Colors.white),
            WhiteNormalTxt(txt: "유아이컴", size: 20, color: Colors.white),
            WhiteNormalTxt(
                txt:
                    "UISP(안경원 관리 프로그램), UICS(전자주문 프로그램), UION(고객관리 프로그램 앱),UIBOX(안경전용 B2B쇼핑몰 프로그램)\n"
                    "을 차별화된 기술로 융합한 안경원 관리 시스템입니다.\n\n"
                    "저는 angular, springboot를 사용하여 풀 스택 웹 개발을 담당했습니다.\n"
                    "제조사-대리점-안경원간의 주문프로세스와 그에 따른 재고, 제품, 주문 관리를 개발하였습니다.\n"
                    "또한, 렌즈프리폼(맞춤렌즈)주문 시 수십개의 파라미터들을 유기적으로 처리하고 자동화하는 기능을 구현하였습니다.",
                size: 15,
                color: Colors.white),
            WhiteNormalTxt(txt: "\n\n이원커뮤니케이션", size: 20, color: Colors.white),
            WhiteNormalTxt(
                txt:
                    "저는 우분투 OS 기반 서버에서 다양한 VPN 연결 방식(PPTP, L2TP, IKEV2, OVPN)과 QoS 로직을 전담으로 개발하였습니다.\n"
                    "이 프로젝트는 기존에 PPTP VPN 연결 방식만 지원하던 서비스를 개선하여 신규 VPN 서비스를 제공하기 위한 것이었습니다.\n"
                    "또한, 신규VPN서비스를 위한 웹사이트를 리액트 기반으로 개발하고, DB 설계를 담당했습니다.\n"
                    "그 외에도 기존에 운영하던 네이버 키워드 검색 광고 입찰서비스의 UI와 속도를 개선하기 위해 일렉트론과 리액트 기반으로 윈도우 응용 프로그램을 제작했습니다.",
                size: 15,
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}
