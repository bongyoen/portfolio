import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/email_bloc/email_bloc.dart';
import 'package:portfolio/bloc/email_bloc/email_state.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';

import '../../../bloc/email_bloc/email_event.dart';
import '../../../core/utils/app_colors.dart';
import '../../cmmn/section_widget.dart';
import '../../cmmn/title_widget.dart';
import 'custom_button.dart';

class ContractSection extends StatefulWidget {
  const ContractSection({super.key});

  @override
  State<ContractSection> createState() => _ContractSectionState();
}

class _ContractSectionState extends State<ContractSection> {
  @override
  Widget build(BuildContext context) {
    EmailBloc bloc = context.read<EmailBloc>();

    return SectionWidget(
      children: [
        const TitleText(title: AppStrings.contrackTitle),
        BlocBuilder<EmailBloc, EmailState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 500,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: bloc.nameController,
                          decoration:
                              const InputDecoration(labelText: AppStrings.name),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: bloc.emailController,
                          decoration: const InputDecoration(
                              labelText: AppStrings.email),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: bloc.subjectController,
                          decoration: const InputDecoration(
                              labelText: AppStrings.subject),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          maxLines: 5,
                          controller: bloc.messageController,
                          decoration: const InputDecoration(
                            labelText: AppStrings.mailTxtGuild,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          label: AppStrings.submit,
                          onPressed: () async {
                            context.read<EmailBloc>().add(EmailSendEvent(
                                emailController: bloc.emailController,
                                messageController: bloc.messageController,
                                nameController: bloc.nameController,
                                subjectController: bloc.subjectController));
                            _showEmailDialog(context);
                          },
                          backgroundColor: AppColors.primaryColor,
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }

  Future<void> _showEmailDialog(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context1) {
        bool isopen = false;

        return BlocProvider.value(
          value: BlocProvider.of<EmailBloc>(context),
          child: StatefulBuilder(
            builder: (context2, setState) {
              return BlocListener<EmailBloc, EmailState>(
                listener: (context3, state) {
                  setState(() {
                    isopen = context3.read<EmailBloc>().isOpen;
                  });
                },
                child: CupertinoAlertDialog(
                  title: const Text(AppStrings.email),
                  content: Text(isopen
                      ? AppStrings.requestOk
                      : AppStrings.requestLoading),
                  actions: [
                    SizedBox(
                      height: 30,
                      child: isopen
                          ? TextButton(
                              onPressed: () {
                                Navigator.of(context1).pop();
                              },
                              child: const Text(AppStrings.ok))
                          : Container(),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
