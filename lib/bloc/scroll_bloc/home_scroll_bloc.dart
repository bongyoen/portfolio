import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_event.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_state.dart';

import '../../repogitory/api_provider.dart';

class HomeScrollBloc extends Bloc<HomeScrollEvent, HomeScrollState> {
  HomeScrollBloc() : super(HomeScrollInitial()) {
    on<ChangeScrollAxis>(_changeScrollAxis);
    on<InitStateEvent>(_initStateEvent);
    on<ChangeHamburgerMenu>(_changeHamburgerMenu);
    on<ChangeHeaderIndex>(_changeHeaderIndex);

    _initialFunc();
  }

  bool _isOpenMenu = false;
  int _appBarHeaderIndex = 0;
  List<String> _headerNames = [];
  List<GlobalKey> _headerNameKeys = [];

  get isOpenMenu => _isOpenMenu;

  get appBarHeaderIndex => _appBarHeaderIndex;

  void _initialFunc() => add(InitStateEvent());

  final ApiProvider _apiProvider = ApiProvider();

  Future<FutureOr<void>> _initStateEvent(
      InitStateEvent event, Emitter<HomeScrollState> emit) async {
    Response response = await _apiProvider.getWebHeaders();

    List<String> headerNameList =
        List<String>.from(response.data['headerNames'] as List);

    _headerNames = headerNameList;
    _headerNameKeys = _headerNames.map((e) => GlobalKey()).toList();

    emit(ChangeScrollState(
        headerNames: _headerNames,
        isOpenMenu: _isOpenMenu,
        headerNameKeys: _headerNameKeys,
        appBarHeaderIndex: _appBarHeaderIndex));
  }

  FutureOr<void> _changeScrollAxis(
      ChangeScrollAxis event, Emitter<HomeScrollState> emit) {
    double sumHeight = 0;
    if (event.controller.offset == event.controller.position.maxScrollExtent) {
      _appBarHeaderIndex = _headerNameKeys.length - 1;

      emit(ChangeScrollState(
          headerNames: _headerNames,
          headerNameKeys: _headerNameKeys,
          isOpenMenu: _isOpenMenu,
          appBarHeaderIndex: _appBarHeaderIndex));
    } else {
      for (GlobalKey key in _headerNameKeys) {
        sumHeight += key.currentContext!.size!.height;

        if (event.controller.offset < sumHeight) {
          int index = _headerNameKeys.indexWhere((element) => element == key);

          if (_appBarHeaderIndex != index) {
            _appBarHeaderIndex = index;
            emit(ChangeScrollState(
                headerNames: _headerNames,
                headerNameKeys: _headerNameKeys,
                isOpenMenu: _isOpenMenu,
                appBarHeaderIndex: _appBarHeaderIndex));
          }

          break;
        }
      }
    }
  }

  FutureOr<void> _changeHamburgerMenu(
      ChangeHamburgerMenu event, Emitter<HomeScrollState> emit) {
    _isOpenMenu = !_isOpenMenu;
    emit(ChangeHamburgerMenuState(
        headerNames: _headerNames,
        isOpenMenu: _isOpenMenu,
        headerNameKeys: _headerNameKeys,
        appBarHeaderIndex: _appBarHeaderIndex));
  }

  FutureOr<void> _changeHeaderIndex(
      ChangeHeaderIndex event, Emitter<HomeScrollState> emit) {
    _appBarHeaderIndex = event.index;
    Navigator.of(event.context).maybePop();

    if (_headerNameKeys[appBarHeaderIndex].currentContext != null) {
      Scrollable.ensureVisible(
          _headerNameKeys[appBarHeaderIndex].currentContext!,
          duration: const Duration(milliseconds: 300));
    }

    emit(ChangeMenuIndex(
      appBarHeaderIndex: _appBarHeaderIndex,
      isOpenMenu: _isOpenMenu,
      headerNameKeys: _headerNameKeys,
      headerNames: _headerNames,
    ));
  }
}
