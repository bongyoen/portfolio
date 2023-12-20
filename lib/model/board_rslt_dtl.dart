import 'package:json_annotation/json_annotation.dart';

part 'board_rslt_dtl.g.dart';

@JsonSerializable()
class BoardRsltDtl {
  final int boardDtlNo;
  final String boardDtlCl;
  final String boardDtlTxt;

  BoardRsltDtl(this.boardDtlNo, this.boardDtlCl, this.boardDtlTxt);

  factory BoardRsltDtl.fromJson(Map<String, dynamic> json) {
    return _$BoardRsltDtlFromJson(json);
  }
}
