import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/bloc/home_bloc/home_event.dart';
import 'package:portfolio/bloc/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_enums.dart';
import '../../repogitory/http/dio_http.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ChangeAppBarHeadersIndex>(_changeAppBarHeadersIndex);
    on<ChangeAppBarHeadersAxis>(_changeAppBarHeadersAxis);
    on<ChangeAppBarHeadersColorByColor>(_changeAppBarHeadersColorByColor);
  }
  int _appBarHeaderIndex = 0;
  int get appBarHeaderIndex => _appBarHeaderIndex;

  FutureOr<void> _changeAppBarHeadersIndex(
      ChangeAppBarHeadersIndex event,
      Emitter<HomeState> emit,
      ) {
    _appBarHeaderIndex = event.index;


    Dio dio = DioHttp().to();
    print("실행");
    dio.get("info").then((value){
      print("되었다!");
      print(value);
    }).catchError((err) {
      print("에러발생 ");
      print(err);
    });


    // http.get(Uri.parse("https://y7sxw6t4kh.execute-api.us-east-1.amazonaws.com/portfolioApi/info")).then((value) {
    //   print(json.decode(value.body));
    // }).catchError((err) {
    //   print("에러발생");
    //   print(err);
    // });
    // print("실행1");

    emit(AppBarHeadersIndexChanged(_appBarHeaderIndex));
  }

  FutureOr<void> _changeAppBarHeadersColorByColor(
      ChangeAppBarHeadersColorByColor event,
      Emitter<HomeState> emit,
      ) {
    _appBarHeaderIndex = event.index;
    emit(AppBarHeadersColorChangedByIndex(_appBarHeaderIndex));
  }

  AppBarHeadersAxis _appBarHeaderAxis = AppBarHeadersAxis.horizontal;
  AppBarHeadersAxis get appBarHeaderAxis => _appBarHeaderAxis;

  FutureOr<void> _changeAppBarHeadersAxis(
      ChangeAppBarHeadersAxis event,
      Emitter<HomeState> emit,
      ) {
    _appBarHeaderAxis = event.headersAxis;
    emit(AppBarHeadersAxisChanged(_appBarHeaderAxis));
  }
}