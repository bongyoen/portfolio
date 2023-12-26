import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/board_bloc/board_bloc.dart';
import 'package:portfolio/bloc/board_bloc/board_state.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> serverlessMap = context.read<TestBloc>().severlessMap;

    return Padding(
      padding: const EdgeInsets.only(bottom: 80, top: 50),
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
              Text("")
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: WhiteNormalTxt(
                txt: "How can I make a portfolio?",
                size: 50,
                color: Colors.white),
          ),
          const WhiteNormalTxt(
              txt: "서버리스 기반의 고가용성 웹어플리케이션", size: 20, color: Colors.white),
          GestureDetector(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (_) => ImageDialog(
                        severlessMap: serverlessMap,
                      ));
            },
            child: SizedBox(
              height: 700,
              child: BlocBuilder<TestBloc, TestState>(
                builder: (context, state) {
                  if (serverlessMap["image"]!.isEmpty) {
                    return Container(
                      height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                    );
                  }

                  return Image.network(
                    serverlessMap["image"]!,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          BlocBuilder<BoardBloc, BoardState>(
            builder: (context, state) {
              if (state is! BoardInitial) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 600),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
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
                              ...board.boardRsltDtls
                                  .map((e) => WhiteNormalTxt(
                                      txt: "- ${e.boardDtlTxt}",
                                      size: 18,
                                      color: Colors.white))
                                  .toList()
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              }

              return Container();
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
