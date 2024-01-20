// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_rslt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardRslt _$BoardRsltFromJson(Map<String, dynamic> json) => BoardRslt(
      json['boardNo'] as int,
      json['boardNm'] as String,
      json['boardCl'] as String,
      (json['boardRsltDtls'] as List<dynamic>)
          .map((e) => BoardRsltDtl.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['boardUrl'] as String?,
    );

Map<String, dynamic> _$BoardRsltToJson(BoardRslt instance) => <String, dynamic>{
      'boardNo': instance.boardNo,
      'boardNm': instance.boardNm,
      'boardUrl': instance.boardUrl,
      'boardCl': instance.boardCl,
      'boardRsltDtls': instance.boardRsltDtls,
    };
