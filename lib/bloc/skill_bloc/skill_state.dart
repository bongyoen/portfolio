import 'package:equatable/equatable.dart';

import '../../core/utils/image_enum.dart';

abstract class SkillState {
  final Map<String, String> map;

  const SkillState(this.map);


}

class SkillInitState extends SkillState {
  SkillInitState() : super(<String, String>{});
}

class SkillImageState extends SkillState {
  final Map<String, String> _map;
  const SkillImageState(this._map): super(_map);

}
