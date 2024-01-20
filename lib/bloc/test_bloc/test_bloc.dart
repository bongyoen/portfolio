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
    on<GetProfileImg>(_getProfileImg);
    on<ChangeHeaderIndex>(_changeHeaderIndex);
    on<ChangeScrollAxis>(_changeScrollAxis);
    _initialFunc();
  }

  final ApiProvider _apiProvider = ApiProvider();
  int appBarHeaderIndex = 0;
  List<GlobalKey> headerNameKeys = [];
  List<Map<String, String>> killLogos = [];
  Map<String, String> severlessMap = {"image": ""};

  final StreamController<String> _todoListSubject =
      StreamController<String>.broadcast();

  Stream<String> get todoList => _todoListSubject.stream;

  void getMapImg() async {
    String image = (await _apiProvider.postImageUrl("profile", "jpg"))
        .data["preSingedUrl"];

    _todoListSubject.sink.add(image);
  }

  void _initialFunc() {
    add(TestAction());
    add(GetProfileImg());
    getMapImg();
  }

  FutureOr<void> _getTitle(TestAction event, Emitter<TestState> emit) async {
    severlessMap["image"] =
        (await _apiProvider.postImageUrl("map", "png")).data["preSingedUrl"];

    killLogos = await _getSkillLogo();

    emit(TestApiProvider(
        index: appBarHeaderIndex,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  Future<FutureOr<void>> _getProfileImg(
      GetProfileImg event, Emitter<TestState> emit) async {
    severlessMap["image"] =
        (await _apiProvider.postImageUrl("map", "png")).data["preSingedUrl"];
  }

  Future<List<Map<String, String>>> _getSkillLogo() async {
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

    Response response = await _apiProvider.postImagesUrl(bearItem);

    List<dynamic> imageList = response.data;

    for (var i = 0; i < imageList.length; i++) {
      bearItem[i]["image"] = imageList[i]["preSingedUrl"];
    }

    return bearItem;
  }

  FutureOr<void> _changeHeaderIndex(
      ChangeHeaderIndex event, Emitter<TestState> emit) {
    appBarHeaderIndex = event.index;

    Navigator.of(event.context).maybePop();

    if (headerNameKeys[appBarHeaderIndex].currentContext != null) {
      Scrollable.ensureVisible(
          headerNameKeys[appBarHeaderIndex].currentContext!,
          duration: const Duration(milliseconds: 1));
    }


    emit(TestApiProvider(
        index: appBarHeaderIndex,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  bool test1 = false;

  void _changeScrollAxis(ChangeScrollAxis event, Emitter<TestState> emit) {
    double sumHeight = 0;
    print("실행됨111");

    if (event.controller.offset == event.controller.position.maxScrollExtent) {
      appBarHeaderIndex = headerNameKeys.length - 1;

      emit(TestApiProvider(
          index: appBarHeaderIndex,
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
            index: appBarHeaderIndex,
            skillLogos: killLogos,
            severlessMap: severlessMap));

        break;
      }
    }
  }
}
