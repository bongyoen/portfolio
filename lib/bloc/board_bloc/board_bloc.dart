import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/board_bloc/board_event.dart';
import 'package:portfolio/bloc/board_bloc/board_state.dart';

import '../../model/board_rslt.dart';
import '../../repogitory/api_provider.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc()
      : super(const BoardInitial(
            amc001List: [], crc001List: [], hmc003List: [])) {
    on<GetHMC003Action>(_getHMC003Func);
    on<GetAMC001Action>(_getAMC001Func);
    on<GetCRC001Action>(_getCRC001Func);

    _initialFunc();
  }

  void _initialFunc() {
    add(GetHMC003Action());
    add(GetAMC001Action());
    add(GetCRC001Action());
  }

  final ApiProvider _apiProvider = ApiProvider();

  List<BoardRslt> hmc003List = [];
  List<BoardRslt> amc001List = [];
  List<BoardRslt> crc001List = [];

  Future<FutureOr<void>> _getHMC003Func(
      GetHMC003Action event, Emitter<BoardState> emit) async {
    Response response = await _apiProvider.postBoardByCl("HMC003");

    List<BoardRslt> boardRslts =
        (response.data as List).map((e) => BoardRslt.fromJson(e)).toList();
    hmc003List = boardRslts;
    emit(BoardHmc003Load(
        hmc003List: hmc003List,
        amc001List: amc001List,
        crc001List: crc001List));
  }

  Future<FutureOr<void>> _getAMC001Func(
      GetAMC001Action event, Emitter<BoardState> emit) async {
    Response response = await _apiProvider.postBoardByCl("AMC001");

    List<BoardRslt> boardRslts =
        (response.data as List).map((e) => BoardRslt.fromJson(e)).toList();
    amc001List = boardRslts;
    emit(BoardAmc001Load(
        hmc003List: hmc003List,
        amc001List: amc001List,
        crc001List: crc001List));
  }

  Future<FutureOr<void>> _getCRC001Func(
      GetCRC001Action event, Emitter<BoardState> emit) async {
    Response response = await _apiProvider.postBoardByCl("CRC001");

    List<BoardRslt> boardRslts =
        (response.data as List).map((e) => BoardRslt.fromJson(e)).toList();
    crc001List = boardRslts;
    emit(BoardCrc001Load(
        hmc003List: hmc003List,
        amc001List: amc001List,
        crc001List: crc001List));
  }
}
