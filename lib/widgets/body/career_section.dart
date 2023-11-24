import 'package:flutter/cupertino.dart';
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
            WhiteNormalTxt(txt: "Carrer", size: 60, color: Colors.deepPurpleAccent),
            WhiteNormalTxt(txt: "다양한 경험과 지식", size: 25, color: Colors.white),
            WhiteNormalTxt(txt: "DB, 프레임워크, 서버", size: 35, color: Colors.white),
            WhiteNormalTxt(txt: "유아이컴", size: 20, color: Colors.white),
            WhiteNormalTxt(
                txt:
                    "UISP(안경원 관리 프로그램), UICS(전자주문 프로그램), UION(고객관리 프로그램 앱),UIBOX(안경전용 B2B쇼핑몰 프로그램)\n"
                    "을 차별화된 기술로 융합한 안경원 관리 시스템입니다.\n\n"
                    "기본적으로 angular, springboot기반 풀 스택 웹 개발을 담당했습니다.\n"
                    "UISP, UICS, UIBOX 프로젝트에 관여하며, 주로 제조자-대리점-안경원과의 주문프로세스와 그에 따른 재고, 제품, 주문을 개발하였습니다.\n"
                    "렌즈프리폼(맞춤렌즈)주문 시 수십개의 파라미터들을 유기적으로 처리하게 자동화하였습니다.",
                size: 15, color: Colors.white),
            WhiteNormalTxt(txt: "\n\n이원커뮤니케이션", size: 20, color: Colors.white),
            WhiteNormalTxt(
                txt: "국내 여러 VPN서비스를 운영하며, WEB기반의 다양한 서비스를 제공하는 회사입니다.\n\n"
                    "재직하면서 기존 PPTP VPN연결방식으로 운영되던 서비스를 우분투OS기반 서버에서 PPTP, L2TP, IKEV2, OVPN연결방식과 Qos로직을 전담으로 개발하였으며,\n"
                    "신규 VPN서비스제공을 위한 웹사이트를 리엑트기반으로 개발하고, DB 전반을 설계하였습니다.\n"
                    "또한 구형의 네이버 키워드 검색광고 서비스를 일렉트론+리엑트 기반으로 UI 및 속도개선하여 윈도우응용프로그램을 제작하였습니다.",
                size: 15, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
