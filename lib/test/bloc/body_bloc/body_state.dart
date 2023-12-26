import 'package:equatable/equatable.dart';

abstract class BodyState extends Equatable {
  @override
  List<Object> get props => [];
}

class BodyInitialState extends BodyState {}

class ServerMapState extends BodyState{
  final Map<String, String> severlessMap;

  ServerMapState({required this.severlessMap});

  @override
  List<Object> get props => [severlessMap];
}

