import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/test/bloc/board_bloc/board_bloc.dart';
import 'package:portfolio/test/bloc/board_bloc/board_state.dart';
import 'package:portfolio/test/core/util/app_style.dart';

import 'how_make_part.dart';
import 'intro_part.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IntroPart(),
        const HowMakePart(),
        Text(
          "서버리스 기반의 고가용성 웹어플리케이션",
          style: AppStyle.ts25w600,
        ),
        // const ServerMapImgPart(),
        const ServerMapIntroPart()
      ],
    );
  }
}

class ServerMapIntroPart extends StatelessWidget {
  const ServerMapIntroPart({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BoardBloc, BoardState>(builder: (context, state) {
        if (state is! BoardInitial) {
          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...state.hmc003List.map((board) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(board.boardNm,
                          style: AppStyle.ts20pc600,),
                      ...board.boardRsltDtls
                          .map((e) =>
                          Text("- ${e.boardDtlTxt}",
                              style: AppStyle.ts18w600,))
                          .toList()
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        }
        return Container();
      });
}
