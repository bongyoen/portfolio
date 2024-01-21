import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/skill_bloc/skill_event.dart';
import 'package:portfolio/bloc/skill_bloc/skill_state.dart';
import 'package:portfolio/core/utils/image_enum.dart';
import 'package:portfolio/repogitory/api_provider.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(SkillInitState()) {
    on<GetSkillImgEvent>(_getSkillImgEvent);
  }

  final ApiProvider _apiProvider = ApiProvider();
  final Map<String, String> _map = {};

  String getImg(SkillImagesEnum name) => _map[name] ?? "";

  Future<FutureOr<void>> _getSkillImgEvent(
      GetSkillImgEvent event, Emitter<SkillState> emit) async {


    Map<String, dynamic> response =
        (await _apiProvider.postImageUrl(event.imageInfos.getName(), "png"))
            .data;

    _map[event.imageInfos.getName()] = response['preSingedUrl'];

    emit(SkillImageState(_map));
  }
}
