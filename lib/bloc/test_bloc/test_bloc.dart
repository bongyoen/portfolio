import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_event.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/repogitory/api_provider.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestAction>(_getTitle);
    on<ChangeHeaderIndex>(_changeHeaderIndex);
    on<ChangeScrollAxis>(_changeScrollAxis);

    _initialFunc();

  }

  final ApiProvider _apiProvider = ApiProvider();
  int appBarHeaderIndex = 0;
  List<GlobalKey> headerNameKeys = [];
  List<Map<String, String>> killLogos = [];
  Map<String, String> severlessMap = {"image": ""};

  void _initialFunc() => add(TestAction());

  FutureOr<void> _getTitle(TestAction event, Emitter<TestState> emit) async {

    severlessMap["image"] =
        (await _apiProvider.postImageUrl("map", "png")).data["preSingedUrl"];

    killLogos = _getSkillLogo();

    emit(TestApiProvider(
        index: appBarHeaderIndex,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  List<Map<String, String>> _getSkillLogo() {
    final bearItem = [
      {"name": "jira", "extension": "png", "image": ""},
      {"name": "react", "extension": "png", "image": ""},
      {"name": "angular", "extension": "png", "image": ""},
      {"name": "aws", "extension": "png", "image": ""},
      {"name": "electron", "extension": "png", "image": ""},
      {"name": "flutter", "extension": "png", "image": ""},
      {"name": "git", "extension": "png", "image": ""},
      {"name": "maria", "extension": "png", "image": ""},
      {"name": "redmine", "extension": "png", "image": ""},
      {"name": "ts", "extension": "png", "image": ""},
      {"name": "mysql", "extension": "png", "image": ""},
    ];

    for (Map<String, String> value in bearItem) {
      _apiProvider.postImageUrl(value["name"]!, value["extension"]!).then(
          (response) =>
              value["image"] = response.data["preSingedUrl"] as String);
    }

    return bearItem;
  }

  FutureOr<void> _changeHeaderIndex(
      ChangeHeaderIndex event, Emitter<TestState> emit) {
    appBarHeaderIndex = event.index;

    // if (headerNameKeys.isEmpty) {
    //   headerNameKeys = headerNames.map((e) => GlobalKey()).toList();
    // }

    Navigator.of(event.context).maybePop();

    if (headerNameKeys[appBarHeaderIndex].currentContext != null) {
      Scrollable.ensureVisible(
          headerNameKeys[appBarHeaderIndex].currentContext!,
          duration: const Duration(milliseconds: 300));
    }
    emit(TestApiProvider(
        // headerNames: headerNames,
        index: appBarHeaderIndex,
        // headerNameKeys: headerNameKeys,
        // isOpenMenu: _isOpenMenu,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  bool test1 = false;

  void _changeScrollAxis(ChangeScrollAxis event, Emitter<TestState> emit) {
    double sumHeight = 0;

    if (event.controller.offset == event.controller.position.maxScrollExtent) {
      appBarHeaderIndex = headerNameKeys.length - 1;
      emit(TestApiProvider(
          // headerNames: headerNames,
          index: appBarHeaderIndex,
          // headerNameKeys: headerNameKeys,
          // isOpenMenu: _isOpenMenu,
          skillLogos: killLogos,
          severlessMap: severlessMap));

      return;
    }

    for (GlobalKey key in headerNameKeys) {
      sumHeight += key.currentContext!.size!.height;

      if (event.controller.offset < sumHeight) {
        int index = headerNameKeys.indexWhere((element) => element == key);
        appBarHeaderIndex = index;

        emit(TestApiProvider(
            // headerNames: headerNames,
            index: appBarHeaderIndex,
            // headerNameKeys: headerNameKeys,
            // isOpenMenu: _isOpenMenu,
            skillLogos: killLogos,
            severlessMap: severlessMap));

        break;
      }
    }
  }

  late Function initScrollEvent = () {
    initScrollEvent = () {};
  };
}
