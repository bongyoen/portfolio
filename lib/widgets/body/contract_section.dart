import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/email_bloc/email_bloc.dart';
import 'package:portfolio/bloc/email_bloc/email_state.dart';

import '../../bloc/email_bloc/email_event.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../text/white-normal-txt.dart';

class ContractSection extends StatelessWidget {
  const ContractSection({super.key});

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
            if (state is EmailSendingState) {
              return Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("보내는중")],
                ),
              );
            }

            if (state is EmailResponseState) {
              return Container(
                width: 200,
                height: 500,
                color: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.resMsg),
                    TextButton(
                        onPressed: () {
                          context.read<EmailBloc>().add(ClearEmailEvent());
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 26,
                          ),
                          child: Text("닫기"),
                        ))
                  ],
                ),
              );
            }

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
                          onPressed: () {
                            context.read<EmailBloc>().add(EmailSendEvent(
                                emailController: emailController,
                                messageController: messageController,
                                nameController: nameController,
                                subjectController: subjectController));
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
}
