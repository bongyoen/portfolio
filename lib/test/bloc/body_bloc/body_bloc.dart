import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/repogitory/api_provider.dart';
import 'body_event.dart';
import 'body_state.dart';

class BodyBloc extends Bloc<BodyEvent, BodyState> {
  BodyBloc() : super(BodyInitialState()) {
    on<ChangeBodyEvent>(_changeBodyEvent);

    init();
  }

  final ApiProvider _apiProvider = ApiProvider();
  final Map<String, String> _severlessMap = {"image": ""};

  get serverMapImg => _severlessMap;

  void init() {
    add(ChangeBodyEvent());
  }

  Future<FutureOr<void>> _changeBodyEvent(
      ChangeBodyEvent event, Emitter<BodyState> emit) async {
    _severlessMap["image"] =
        (await _apiProvider.postImageUrl("map", "png")).data["preSingedUrl"];

    emit(ServerMapState(severlessMap: _severlessMap));
  }
}
