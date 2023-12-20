import 'dart:async';

import 'package:dio/dio.dart';
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
    on<ChangeHamburgerMenu>(_changeHamburgerMenu);
  }

  final ApiProvider _apiProvider = ApiProvider();
  int _appBarHeaderIndex = 0;
  List<String> headerNames = [];
  List<GlobalKey> headerNameKeys = [];
  bool _isOpenMenu = false;
  List<Map<String, String>> killLogos = [];
  Map<String, String> severlessMap = {"image": ""};

  int get appBarHeaderIndex => _appBarHeaderIndex;

  bool get isOpenMenu => _isOpenMenu;

  FutureOr<void> _changeHamburgerMenu(
      ChangeHamburgerMenu event, Emitter<TestState> emit) {
    _isOpenMenu = !_isOpenMenu;
    emit(TestApiProvider(
        headerNames: headerNames,
        index: _appBarHeaderIndex,
        headerNameKeys: headerNameKeys,
        isOpenMenu: _isOpenMenu,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  FutureOr<void> _getTitle(TestAction event, Emitter<TestState> emit) async {
    // _apiProvider.postBoardByCl("HMC003").then((value) {
    //   print("\n\n\nvalue.data : ${value.data}\n\n\n\n");
    //   print("(value.data as List) : ${(value.data as List)}\n\n\n\n");
    //   List<BoardRslt> boardRslts =
    //       (value.data as List).map((e) => BoardRslt.fromJson(e)).toList();
    //
    //   for (var value1 in boardRslts) {
    //     for (var value in value1.boardRsltDtls) {
    //       print(value.boardDtlTxt);
    //     }
    //   }
    // });

    severlessMap["image"] =
        (await _apiProvider.postImageUrl("map", "png")).data["preSingedUrl"];

    Response response = await _apiProvider.getWebHeaders();
    killLogos = _getSkillLogo();
    List<String> headerNameList =
        List<String>.from(response.data['headerNames'] as List);

    headerNames = headerNameList;

    if (headerNameKeys.isEmpty) {
      headerNameKeys = headerNames.map((e) => GlobalKey()).toList();
    }
    emit(TestApiProvider(
        headerNames: headerNames,
        index: _appBarHeaderIndex,
        headerNameKeys: headerNameKeys,
        isOpenMenu: _isOpenMenu,
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
    _appBarHeaderIndex = event.index;

    if (headerNameKeys.isEmpty) {
      headerNameKeys = headerNames.map((e) => GlobalKey()).toList();
    }

    Navigator.of(event.context).maybePop();

    if (headerNameKeys[_appBarHeaderIndex].currentContext != null) {
      Scrollable.ensureVisible(
          headerNameKeys[_appBarHeaderIndex].currentContext!,
          duration: const Duration(milliseconds: 300));
    }
    emit(TestApiProvider(
        headerNames: headerNames,
        index: _appBarHeaderIndex,
        headerNameKeys: headerNameKeys,
        isOpenMenu: _isOpenMenu,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  bool test1 = false;

  void _changeScrollAxis(ChangeScrollAxis event, Emitter<TestState> emit) {
    double sumHeight = 0;

    if (event.controller.offset == event.controller.position.maxScrollExtent) {
      _appBarHeaderIndex = headerNameKeys.length - 1;
      emit(TestApiProvider(
          headerNames: headerNames,
          index: _appBarHeaderIndex,
          headerNameKeys: headerNameKeys,
          isOpenMenu: _isOpenMenu,
          skillLogos: killLogos,
          severlessMap: severlessMap));

      return;
    }

    for (GlobalKey key in headerNameKeys) {
      sumHeight += key.currentContext!.size!.height;

      if (event.controller.offset < sumHeight) {
        int index = headerNameKeys.indexWhere((element) => element == key);
        _appBarHeaderIndex = index;

        emit(TestApiProvider(
            headerNames: headerNames,
            index: _appBarHeaderIndex,
            headerNameKeys: headerNameKeys,
            isOpenMenu: _isOpenMenu,
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
