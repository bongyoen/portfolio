import 'package:equatable/equatable.dart';

import '../../core/utils/image_enum.dart';

abstract class SkillEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSkillImgEvent extends SkillEvent{
  final SkillImagesEnum imageInfos;

  GetSkillImgEvent({required this.imageInfos});
}