import 'package:equatable/equatable.dart';

abstract class BoardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHMC003Action extends BoardEvent {}

class GetAMC001Action extends BoardEvent {}