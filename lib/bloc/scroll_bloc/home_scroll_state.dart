import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeScrollState extends Equatable {
  final List<String> headerNames;
  final bool isOpenMenu;
  final List<GlobalKey> headerNameKeys;
  final int appBarHeaderIndex;

  const HomeScrollState(
      {required this.headerNames,
      required this.isOpenMenu,
      required this.headerNameKeys,
      required this.appBarHeaderIndex});

  @override
  List<Object?> get props => [];
}

class HomeScrollInitial extends HomeScrollState {
  HomeScrollInitial()
      : super(
            headerNameKeys: [],
            isOpenMenu: false,
            headerNames: [],
            appBarHeaderIndex: 0);
}

class ChangeScrollState extends HomeScrollState {
  const ChangeScrollState(
      {required super.headerNames,
      required super.isOpenMenu,
      required super.headerNameKeys,
      required super.appBarHeaderIndex});

  @override
  List<Object?> get props => [headerNames, headerNameKeys, appBarHeaderIndex];
}

class ChangeHamburgerMenuState extends HomeScrollState {
  const ChangeHamburgerMenuState(
      {required super.headerNames,
      required super.isOpenMenu,
      required super.headerNameKeys,
      required super.appBarHeaderIndex});

  @override
  List<Object?> get props => [isOpenMenu];
}

class ChangeMenuIndex extends HomeScrollState {
  ChangeMenuIndex(
      {required List<String> headerNames,
      required bool isOpenMenu,
      required List<GlobalKey> headerNameKeys,
      required int appBarHeaderIndex})
      : super(
            headerNames: headerNames,
            headerNameKeys: headerNameKeys,
            isOpenMenu: isOpenMenu,
            appBarHeaderIndex: appBarHeaderIndex) {}

  @override
  List<Object?> get props => [headerNameKeys, appBarHeaderIndex];

  void test() {}
}
