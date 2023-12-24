import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class EmailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailSendEvent extends EmailEvent {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController subjectController;
  final TextEditingController messageController;

  EmailSendEvent(
      {required this.nameController,
      required this.emailController,
      required this.subjectController,
      required this.messageController});
}

class EmailCompleteEvent extends EmailEvent {
  final int statusCode;
  final String resMsg;

  EmailCompleteEvent({required this.statusCode, required this.resMsg});
}

class ClearEmailEvent extends EmailEvent {}
