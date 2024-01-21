import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class HomeInitAction extends HomeEvent {}

class ChangeHeaderIndex extends HomeEvent {
  final int index;
  final BuildContext context;

  ChangeHeaderIndex({required this.context, required this.index});
}

class ChangeScrollAxis extends HomeEvent {
  final ScrollController controller;

  ChangeScrollAxis({required this.controller});
}

class GetProfileImg extends HomeEvent{}