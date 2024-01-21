import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../repogitory/api_provider.dart';

enum SkillImagesEnum {
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
  maria
}

enum SkillSectionEnum { Strong, Knowledgeable, ETC }

extension SkillImagesMap on SkillImagesEnum {
  List<Map<String, String>> getImageCond() {
    return SkillImagesEnum.values
        .map((e) => ({"name": e.getName(), "extension": "png", "image": ""}))
        .toList();
  }
}

extension SkillSectionExtention on SkillSectionEnum {
  List<SkillImagesEnum> getSkills() {
    switch (this) {
      case SkillSectionEnum.Strong:
        return [
          SkillImagesEnum.angular,
          SkillImagesEnum.react,
          SkillImagesEnum.electron,
          SkillImagesEnum.ts,
          SkillImagesEnum.springboot,
          SkillImagesEnum.mysql,
          SkillImagesEnum.maria,
        ];

      case SkillSectionEnum.Knowledgeable:
        return [
          SkillImagesEnum.flutter,
          SkillImagesEnum.aws,
        ];
      case SkillSectionEnum.ETC:
        return [
          SkillImagesEnum.jira,
          SkillImagesEnum.redmine,
          SkillImagesEnum.git,
        ];
    }
  }
}

extension ApiSetContext on BuildContext {
  ApiProvider get api => ApiProvider();
}

extension ImageInfosExtension on SkillImagesEnum {
  Future<Response> getImage(BuildContext context, String extension) async {
    return await context.api.postImageUrl(name, extension);
  }

  String getName() {
    return name;
  }
}
