import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_event.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/repogitory/api_provider.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestAction>(_getTitle);
  }

  final ApiProvider _apiProvider = ApiProvider();

  Future<FutureOr<void>> _getTitle(
      TestAction event, Emitter<TestState> emit) async {
    Response response = await _apiProvider.getInfo();
    print("여기까지??");
    print(response);
    emit(TestApiProvider(Map<String, String>.from(response.data)));
  }
}
