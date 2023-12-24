import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeScrollEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeScrollAxis extends HomeScrollEvent{
  final ScrollController controller;
  ChangeScrollAxis({required this.controller});
}

class InitStateEvent extends HomeScrollEvent {}
class ChangeHamburgerMenu extends HomeScrollEvent {}
class ChangeHeaderIndex extends HomeScrollEvent {
  final int index;
  final BuildContext context;

  ChangeHeaderIndex({required this.context, required this.index});
}
