import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/email_bloc/email_bloc.dart';
import 'package:portfolio/bloc/email_bloc/email_state.dart';

import '../../bloc/email_bloc/email_event.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../text/white-normal-txt.dart';

class ContractSection extends StatefulWidget {
  const ContractSection({super.key});

  @override
  State<ContractSection> createState() => _ContractSectionState();
}

class _ContractSectionState extends State<ContractSection> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<EmailBloc, EmailState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WhiteNormalTxt(
                    txt: "Contract", size: 60, color: Colors.deepPurpleAccent),
                SizedBox(
                  width: 500,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: emailController,
                          decoration:
                              const InputDecoration(labelText: 'E-mail'),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: subjectController,
                          decoration:
                              const InputDecoration(labelText: 'Subject'),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          maxLines: 5,
                          controller: messageController,
                          decoration: const InputDecoration(
                            labelText: 'Type a message here...',
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          label: 'Submit',
                          onPressed: () async {
                            context.read<EmailBloc>().add(EmailSendEvent(
                                emailController: emailController,
                                messageController: messageController,
                                nameController: nameController,
                                subjectController: subjectController));
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
        ),
      ),
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
                  title: const Text("Email"),
                  content: Text(isopen ? "전송완료" : "전송중"),
                  actions: [
                    SizedBox(
                      height: 30,
                      child: isopen
                          ? TextButton(
                              onPressed: () {
                                Navigator.of(context1).pop();
                              },
                              child: const Text("확인"))
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
