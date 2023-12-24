import 'package:equatable/equatable.dart';

abstract class EmailState extends Equatable {
  @override
  List<Object> get props => [];
}


class EmailInitalState extends EmailState{}

class EmailSendingState extends EmailState{}

class EmailResponseState extends EmailState{
  final int statusCode;
  final String resMsg;

  EmailResponseState({required this.statusCode, required this.resMsg});
}