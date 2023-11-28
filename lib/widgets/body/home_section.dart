import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WhiteNormalTxt(
                      txt: "안녕하세요 저는", size: 25, color: Colors.white),
                  Row(children: [
                    WhiteNormalTxt(txt: "김봉연", size: 40, color: Colors.white),
                    WhiteNormalTxt(
                        txt: " 이라고 합니다", size: 15, color: Colors.white)
                  ]),
                  WhiteNormalTxt(
                      txt: "웹을 만드는 개발자입니다.", size: 15, color: Colors.white)
                ],
              ),
              Text("homeImage")
            ],
          ),
          const WhiteNormalTxt(
              txt: "How can I make a portfolio?",
              size: 50,
              color: Colors.white),
          const WhiteNormalTxt(
              txt: "서버리스 기반의 고가용성 웹어플리케이션",

              // txt:
              // "해당 프로젝트는 AWS를 활용하여 제작되었습니다.\n"
              //     "프론트의 배포는 amplifire와 git을 연동하였고, 백엔드는 appRunner를 사용하였습니다. DB는 RDS에서 psql을 사용하고, 파일관리는 S3를 사용합니다.\n"
              //     "모두 VPC내부에 존재하거나 DB의 경우 퍼블릭을 허용하지 않고, VPC endpoint를 설정하여 VPC내부에서만 접근할 수 있게하였습니다.\n"
              //     "로컬개발 및 테스트를 위해 VPC내부에 외부에 공개하지 않는 EC2 인스턴스를 생성하며 개발 시 ssh연결을 통한 DB접속 및 테스트를 진행합니다.",
              size: 20,
              color: Colors.white),
          // InteractiveViewer(
          //     constrained: true,
          //     child: Image.asset('assets/img/map.png',)),

          GestureDetector(
            onTap: () async {
              await showDialog(
                  context: context, builder: (_) => const ImageDialog());
            },
            child: BlocBuilder<TestBloc, TestState>(
              builder: (context, state) {
                if(state is TestApiProvider) {
                  return Image.network(state.severlessMap["image"]!);
                }
                return Container();
              },
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteNormalTxt(
                  txt: "FRONT_END", size: 20, color: Colors.deepPurpleAccent),
              WhiteNormalTxt(
                  txt: " - FLUTTER: BLOC패턴을 기반으로 웹을 제작.",
                  size: 18,
                  color: Colors.white),
              WhiteNormalTxt(
                  txt: " - AMPLIFY: frontEnd에 특화, Cloud Front 이용, https 및 배포용이",
                  size: 18,
                  color: Colors.white),
              WhiteNormalTxt(
                  txt: "BACK_END", size: 20, color: Colors.deepPurpleAccent),
              WhiteNormalTxt(
                  txt:
                      " - APP RUNNER: 일반 서버나 EC2의 경우 최소한의 설정 및 유지관리가 필요하나, 완전관리형 서비스로 유지보수의 간편함.",
                  size: 18,
                  color: Colors.white),
              WhiteNormalTxt(
                  txt:
                      " - API GATEWAY: API 관리용의성과 AppRunner부하 시 Rambda분리와 Api관리를 위함",
                  size: 18,
                  color: Colors.white),
              WhiteNormalTxt(
                  txt: "BUILD", size: 20, color: Colors.deepPurpleAccent),
              WhiteNormalTxt(
                  txt:
                      " - PUSH이벤트 시에 GIT_ACTION으로 Amplify와 AppRunner에 배포합니다. Image는 ECR에 저장 후 gitAction의 pipeLine설정해 DI/DC를 구축했습니다.",
                  size: 18,
                  color: Colors.white),
              WhiteNormalTxt(
                  txt: "DB", size: 20, color: Colors.deepPurpleAccent),
              WhiteNormalTxt(
                  txt:
                      " - PSQL: AURORA를 사용하려했지만 비용문제로 인해, 차선으로 현 시점 MYSQL보다 이점이 있는 PSQL을 사용.",
                  size: 18,
                  color: Colors.white),
              WhiteNormalTxt(
                  txt: "RESOURCE", size: 20, color: Colors.deepPurpleAccent),
              WhiteNormalTxt(
                  txt:
                      " - S3: 미디어 및 파일들을 처리합니다. 직접적인 노출을 피하고자 BACK에서 PRE-SIGNED URL을 생성해 보여주는 방식을 채택했습니다.",
                  size: 18,
                  color: Colors.white),
              WhiteNormalTxt(
                  txt: "MAINTENANCE", size: 20, color: Colors.deepPurpleAccent),
              WhiteNormalTxt(
                  txt:
                      " - EC2: 모든 구성이 VPC내부에 존재합니다. 개발자 또한 직접이 불가하기에 외부에 공개하지 않는 EC2를 내부에 두어 SSH를 통한 제어를 가능하게합니다.",
                  size: 18,
                  color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InteractiveViewer(
          constrained: true,
          child: Image.asset(
            'assets/img/map.png',
          )),
    );
  }
}
