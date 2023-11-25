import 'package:equatable/equatable.dart';
import 'package:portfolio/repogitory/api_provider.dart';

abstract class TestState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TestInitial extends TestState {}

class TestApiProvider extends TestState {
  final Map<String, String> _title;

  TestApiProvider(this._title);

  Map<String, String> get titleMap => _title;
}
