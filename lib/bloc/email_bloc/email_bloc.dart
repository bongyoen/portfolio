import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/email_bloc/email_event.dart';
import 'package:portfolio/bloc/email_bloc/email_state.dart';

import '../../repogitory/api_provider.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(EmailInitalState()) {
    on<EmailSendEvent>(_emailSendEvent);
    on<EmailCompleteEvent>(_emailCompleteEvent);
    on<ClearEmailEvent>(_clearEmailEvent);
  }

  final ApiProvider _apiProvider = ApiProvider();

  Future<FutureOr<void>> _emailSendEvent(
      EmailSendEvent event, Emitter<EmailState> emit) async {
    final name = event.nameController.value.text;
    final email = event.emailController.value.text;
    final subject = event.subjectController.value.text;
    final message = event.messageController.value.text;

    emit(EmailSendingState());

    Response response =
        await _apiProvider.postSendEmail(name, email, subject, message);

    int? statusCode = response.statusCode;
    String? resMsg = response.data["resMsg"];

    add(EmailCompleteEvent(
        statusCode: statusCode ?? 400, resMsg: resMsg ?? "fail"));
  }

  FutureOr<void> _emailCompleteEvent(
      EmailCompleteEvent event, Emitter<EmailState> emit) {
      emit(EmailResponseState(statusCode: event.statusCode, resMsg: event.resMsg));
  }

  FutureOr<void> _clearEmailEvent(ClearEmailEvent event, Emitter<EmailState> emit) {
    emit(EmailInitalState());
  }
}
