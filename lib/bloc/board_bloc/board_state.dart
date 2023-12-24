import 'package:equatable/equatable.dart';

import '../../model/board_rslt.dart';

abstract class BoardState extends Equatable {
  final List<BoardRslt> hmc003List;
  final List<BoardRslt> amc001List;
  final List<BoardRslt> crc001List;

  const BoardState({required this.hmc003List, required this.amc001List, required this.crc001List});

  @override
  List<Object?> get props => [];
}

class BoardInitial extends BoardState {
  const BoardInitial({required super.hmc003List, required super.amc001List, required super.crc001List});
}

class BoardHmc003Load extends BoardState {
  const BoardHmc003Load({required super.hmc003List, required super.amc001List, required super.crc001List});
  @override
  List<Object?> get props => [hmc003List];
}

class BoardAmc001Load extends BoardState {
  const BoardAmc001Load({required super.hmc003List, required super.amc001List, required super.crc001List});
  @override
  List<Object?> get props => [amc001List];
}

class BoardCrc001Load extends BoardState {
  const BoardCrc001Load({required super.hmc003List, required super.amc001List, required super.crc001List});
  @override
  List<Object?> get props => [crc001List];
}
