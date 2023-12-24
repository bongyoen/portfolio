import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/board_bloc/board_bloc.dart';
import 'package:portfolio/bloc/board_bloc/board_state.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';
import 'package:shimmer/shimmer.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    var severlessMap = context.read<TestBloc>().severlessMap;

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
                  context: context,
                  builder: (_) => ImageDialog(
                        severlessMap: severlessMap,
                      ));
            },
            child: BlocBuilder<TestBloc, TestState>(
              builder: (context, state) {
                if (state is TestApiProvider) {
                  return Image.network(state.severlessMap["image"]!);
                }
                return Container();
              },
            ),
          ),
          BlocBuilder<BoardBloc, BoardState>(
            builder: (context, state) {
              if (state is BoardLoad) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...state.hmc003List.map((board) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WhiteNormalTxt(
                              txt: board.boardNm,
                              size: 20,
                              color: Colors.deepPurpleAccent),
                          ...board.boardRsltDtls.map((e) =>
                              WhiteNormalTxt(
                                  txt: "- ${e.boardDtlTxt}",
                                  size: 18,
                                  color: Colors.white)
                          ).toList()
                        ],
                      );
                    }).toList(),
                  ],
                );
              }

              return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      const SizedBox(height: 12),
                    ]),
              );;
            },
          ),
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final Map<String, String> severlessMap;

  const ImageDialog({super.key, required this.severlessMap});

  @override
  Widget build(BuildContext context) {
    if (severlessMap == null) return Container();

    return Dialog(
      child: InteractiveViewer(
          constrained: true, child: Image.network(severlessMap["image"]!)),
    );
  }
}
