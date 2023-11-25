import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TestState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TestInitial extends TestState {}

class TestApiProvider extends TestState {
  final List<String> headerNames;
  final List<GlobalKey> headerNameKeys;
  final int index;
  final bool isOpenMenu;

  TestApiProvider(
      {required this.headerNames,
      required this.index,
      required this.headerNameKeys,
      required this.isOpenMenu});

  @override
  List<Object?> get props => [index, isOpenMenu];
}

class ChangeHeaderBtnState extends TestState {
  final List<String> _title;
  final int _index;

  ChangeHeaderBtnState(this._title, this._index);
}
