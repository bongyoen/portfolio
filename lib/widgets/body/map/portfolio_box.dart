import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import '../../../core/utils/app_styles.dart';
import '../../../model/board_rslt.dart';
import '../../../model/board_rslt_dtl.dart';

class PortfolioBox extends StatelessWidget {
  const PortfolioBox({super.key, required this.hmc003Item});

  final BoardRslt hmc003Item;

  @override
  Widget build(BuildContext context) {
    List<BoardRsltDtl> boardDtlList = hmc003Item.boardRsltDtls;

    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: AppPadStyles.p10t,
              child: Text(
                hmc003Item.boardNm,
                style: AppTxtStyles.s20blue,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(boardDtlList.length, (index) {
              BoardRsltDtl dtl = boardDtlList[index];

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
                        constraints: const BoxConstraints(minWidth: 150),
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
                                      }))),
                    Flexible(
                      child: Text(dtl.boardDtlTxt),
                    ),
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
