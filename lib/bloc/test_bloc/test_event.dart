import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';

abstract class TestEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class TestAction extends TestEvent {}

class ChangeHeaderIndex extends TestEvent {
  final int index;
  final BuildContext context;

  ChangeHeaderIndex({required this.context, required this.index});
}

class ChangeScrollAxis extends TestEvent {
  final ScrollController controller;

  ChangeScrollAxis({required this.controller});
}

class GetProfileImg extends TestEvent{}