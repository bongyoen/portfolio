import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeApiProvider extends HomeState {
  final int index;
  final List<Map<String, String>> skillLogos;
  final Map<String, String> severlessMap;

  HomeApiProvider(
      {required this.index,
      required this.skillLogos,
      required this.severlessMap});

  @override
  List<Object?> get props => [];
}
