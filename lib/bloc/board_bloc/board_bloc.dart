import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/board_bloc/board_event.dart';
import 'package:portfolio/bloc/board_bloc/board_state.dart';

import '../../model/board_rslt.dart';
import '../../repogitory/api_provider.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(BoardInitial()) {
    on<GetHMC003Action>(_getHMC003Func);
    on<GetAMC001Action>(_getAmc001Func);
  }

  final ApiProvider _apiProvider = ApiProvider();

  List<BoardRslt> hmc003List = [];
  List<BoardRslt> amc001List = [];

  Future<FutureOr<void>> _getHMC003Func(
      GetHMC003Action event, Emitter<BoardState> emit) async {
    Response response = await _apiProvider.postBoardByCl("HMC003");
    List<BoardRslt> boardRslts =
        (response.data as List).map((e) => BoardRslt.fromJson(e)).toList();

    hmc003List = boardRslts;
    emit(BoardLoad(hmc003List: boardRslts, amc001List: amc001List));
  }

  Future<FutureOr<void>> _getAmc001Func(
      GetAMC001Action event, Emitter<BoardState> emit) async {
    Response response = await _apiProvider.postBoardByCl("AMC001");
    List<BoardRslt> boardRslts =
    (response.data as List).map((e) => BoardRslt.fromJson(e)).toList();
    amc001List = boardRslts;
    emit(BoardLoad(hmc003List: hmc003List, amc001List: amc001List));
  }
}
