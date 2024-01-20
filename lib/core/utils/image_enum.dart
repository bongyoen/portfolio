import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../repogitory/api_provider.dart';

enum ImageInfos {
  aws,
  flutter,
  mysql,
  map,
  react,
  redmine,
  angular,
  git,
  jira,
  electron,
  springboot,
  html,
  ts,
  maria,
  profile
}

enum SkillSectionEnum { Strong, Knowledgeable, ETC }

extension SkillSectionExtention on SkillSectionEnum {
  List<ImageInfos> getSkills() {
    switch (this) {
      case SkillSectionEnum.Strong:
        return [
          ImageInfos.angular,
          ImageInfos.react,
          ImageInfos.electron,
          ImageInfos.ts,
          ImageInfos.springboot,
          ImageInfos.mysql,
          ImageInfos.maria,
        ];

      case SkillSectionEnum.Knowledgeable:
        return [
          ImageInfos.flutter,
          ImageInfos.aws,
        ];
      case SkillSectionEnum.ETC:
        return [
          ImageInfos.jira,
          ImageInfos.redmine,
          ImageInfos.git,
        ];
    }
  }
}

extension ApiSetContext on BuildContext {
  ApiProvider get api => ApiProvider();
}

extension ImageInfosExtension on ImageInfos {
  Future<Response> getImage(BuildContext context, String extension) async {
    return await context.api.postImageUrl(name, extension);
  }

  String getName() {
    return name;
  }
}
