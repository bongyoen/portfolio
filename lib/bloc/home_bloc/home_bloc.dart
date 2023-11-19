import 'dart:async';

import 'package:portfolio/bloc/home_bloc/home_event.dart';
import 'package:portfolio/bloc/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_enums.dart';

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
