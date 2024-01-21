import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/home_event.dart';
import 'package:portfolio/bloc/test_bloc/home_state.dart';
import 'package:portfolio/core/utils/image_enum.dart';
import 'package:portfolio/repogitory/api_provider.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitAction>(_getTitle);
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
  late final String _profileImg;

  final SkillImagesEnum skill = SkillImagesEnum.values[0];
  final StreamController<String> profileImageStreamCtrl =
      StreamController<String>.broadcast();

  Stream<String> get profileStream => profileImageStreamCtrl.stream;

  String get profileImage => _profileImg;

  void getMapImg() async {
    String image = (await _apiProvider.postImageUrl("profile", "jpg"))
        .data["preSingedUrl"];
    _profileImg = image;
    profileImageStreamCtrl.sink.add(image);
  }

  void _initialFunc() {
    add(HomeInitAction());
    add(GetProfileImg());
    getMapImg();
  }

  FutureOr<void> _getTitle(
      HomeInitAction event, Emitter<HomeState> emit) async {
    severlessMap["image"] =
        (await _apiProvider.postImageUrl("map", "png")).data["preSingedUrl"];

    killLogos = await _getSkillLogo();

    emit(HomeApiProvider(
        index: appBarHeaderIndex,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  Future<FutureOr<void>> _getProfileImg(
      GetProfileImg event, Emitter<HomeState> emit) async {
    severlessMap["image"] =
        (await _apiProvider.postImageUrl("map", "png")).data["preSingedUrl"];
  }

  Future<List<Map<String, String>>> _getSkillLogo() async {
    List<Map<String, String>> imagesCond = skill.getImageCond();
    Response response = await _apiProvider.postImagesUrl(imagesCond);

    for (var i = 0; i < response.data.length; i++) {
      imagesCond[i]["image"] = response.data[i]["preSingedUrl"];
    }

    return imagesCond;
  }

  FutureOr<void> _changeHeaderIndex(
      ChangeHeaderIndex event, Emitter<HomeState> emit) {
    appBarHeaderIndex = event.index;

    Navigator.of(event.context).maybePop();

    if (headerNameKeys[appBarHeaderIndex].currentContext != null) {
      Scrollable.ensureVisible(
          headerNameKeys[appBarHeaderIndex].currentContext!,
          duration: const Duration(milliseconds: 1));
    }

    emit(HomeApiProvider(
        index: appBarHeaderIndex,
        skillLogos: killLogos,
        severlessMap: severlessMap));
  }

  void _changeScrollAxis(ChangeScrollAxis event, Emitter<HomeState> emit) {
    double sumHeight = 0;

    if (event.controller.offset == event.controller.position.maxScrollExtent) {
      appBarHeaderIndex = headerNameKeys.length - 1;

      emit(HomeApiProvider(
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

        emit(HomeApiProvider(
            index: appBarHeaderIndex,
            skillLogos: killLogos,
            severlessMap: severlessMap));

        break;
      }
    }
  }
}
