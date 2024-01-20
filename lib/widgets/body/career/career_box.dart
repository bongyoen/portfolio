import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/model/board_rslt.dart';
import 'package:universal_html/html.dart' as html;

import '../../../model/board_rslt_dtl.dart';

class CareerBox extends StatelessWidget {
  const CareerBox({super.key, required this.crc001Item});

  final BoardRslt crc001Item;

  @override
  Widget build(BuildContext context) {
    List<BoardRsltDtl> boardDtlList = crc001Item.boardRsltDtls;

    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: AppPadStyles.p10t,
              child: TextButton(
                onPressed: () {
                  html.window.open(crc001Item.boardUrl!, "_blank");
                },
                child: Text(
                  crc001Item.boardNm,
                  style: AppTxtStyles.s20blue,
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(boardDtlList.length, (index) {
              BoardRsltDtl dtl = boardDtlList[index];

              if (index == 0) {
                return Padding(
                  padding: AppPadStyles.p10t10b,
                  child: Text(boardDtlList[0].boardDtlTxt),
                );
              }

              return Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: const BorderSide(style: BorderStyle.solid),
                  bottom: BorderSide(
                      style: index == boardDtlList.length - 1
                          ? BorderStyle.solid
                          : BorderStyle.none),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints:
                          const BoxConstraints(maxWidth: 300, minWidth: 100),
                      child: dtl.boardDtlUrl == null
                          ? Text(dtl.boardDtlTitle!)
                          : RichText(
                              text: TextSpan(
                                  text: dtl.boardDtlTitle!,
                                  style: AppTxtStyles.sLink,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      html.window
                                          .open(dtl.boardDtlUrl!, "_blank");
                                    })),
                    ),
                    Flexible(child: Text(dtl.boardDtlTxt))
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
