import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContractSection extends StatelessWidget {
  const ContractSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("contract"),
          SizedBox(
            width: 500,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-mail'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Subject'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Type a message here...',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // CustomButton(
                  //   label: 'Submit',
                  //   onPressed: () {},
                  //   backgroundColor: AppColors.primaryColor,
                  //   width: _getFormWidth(context.width),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
