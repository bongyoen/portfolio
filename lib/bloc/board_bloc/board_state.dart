import 'package:equatable/equatable.dart';

import '../../model/board_rslt.dart';

abstract class BoardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BoardInitial extends BoardState {}

class BoardLoad extends BoardState {
  final List<BoardRslt> hmc003List;
  final List<BoardRslt> amc001List;
  final List<BoardRslt> crc001List;

  BoardLoad({required this.hmc003List, required this.amc001List, required this.crc001List});

  @override
  List<Object?> get props => [hmc003List, amc001List, crc001List];
}
