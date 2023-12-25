import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/board_bloc/board_bloc.dart';
import '../../bloc/board_bloc/board_state.dart';
import '../text/white-normal-txt.dart';

class CareerSection extends StatelessWidget {
  const CareerSection({super.key});

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
                txt: "Carrer", size: 60, color: Colors.deepPurpleAccent),
            const WhiteNormalTxt(
                txt: "다양한 경험과 지식", size: 25, color: Colors.white),
            const WhiteNormalTxt(
                txt: "DB, 프레임워크, 서버", size: 35, color: Colors.white),
            SizedBox(
              child: BlocBuilder<BoardBloc, BoardState>(
                builder: (context, state) {
                  if (state is! BoardInitial && state.crc001List.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...state.crc001List.map((e) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: WhiteNormalTxt(
                                      txt: e.boardNm,
                                      size: 20,
                                      color: Colors.white)),
                              ...e.boardRsltDtls.map((dtl) {
                                if (e.boardRsltDtls[0] == dtl) {
                                  return WhiteNormalTxt(
                                    txt: "${dtl.boardDtlTxt}\n",
                                    size: 15,
                                    color: Colors.blue,
                                  );
                                }

                                return WhiteNormalTxt(
                                    txt: "${dtl.boardDtlTxt}\n",
                                    size: 15,
                                    color: Colors.white);
                              }).toList(),
                            ],
                          );
                        }).toList()
                      ],
                    );
                  } else {
                    // context.read<BoardBloc>().add(GetCRC001Action());
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
