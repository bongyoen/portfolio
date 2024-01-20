// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_rslt_dtl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardRsltDtl _$BoardRsltDtlFromJson(Map<String, dynamic> json) => BoardRsltDtl(
      json['boardDtlNo'] as int,
      json['boardDtlCl'] as String,
      json['boardDtlTxt'] as String,
      json['boardDtlUrl'] as String?,
      json['boardDtlTitle'] as String?,
    );

Map<String, dynamic> _$BoardRsltDtlToJson(BoardRsltDtl instance) =>
    <String, dynamic>{
      'boardDtlNo': instance.boardDtlNo,
      'boardDtlCl': instance.boardDtlCl,
      'boardDtlTitle': instance.boardDtlTitle,
      'boardDtlTxt': instance.boardDtlTxt,
      'boardDtlUrl': instance.boardDtlUrl,
    };
