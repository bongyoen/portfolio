import 'package:equatable/equatable.dart';

abstract class TestState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TestInitial extends TestState {}

class TestApiProvider extends TestState {
  final int index;
  final List<Map<String, String>> skillLogos;
  final Map<String, String> severlessMap;

  TestApiProvider(
      {
      required this.index,
      required this.skillLogos,
      required this.severlessMap});

  @override
  List<Object?> get props => [index,
    // headerNameKeys,
    skillLogos];
}

class ChangeHeaderBtnState extends TestState {
  final List<String> _title;
  final int _index;

  ChangeHeaderBtnState(this._title, this._index);
}
