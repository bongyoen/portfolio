import 'package:json_annotation/json_annotation.dart';

import 'board_rslt_dtl.dart';

part 'board_rslt.g.dart';

@JsonSerializable()
class BoardRslt {
  final int boardNo;
  final String boardNm;
  final String boardCl;
  final List<BoardRsltDtl> boardRsltDtls;

  BoardRslt(this.boardNo, this.boardNm, this.boardCl, this.boardRsltDtls);

  factory BoardRslt.fromJson(Map<String, dynamic> json) {
    return _$BoardRsltFromJson(json);
  }
}
