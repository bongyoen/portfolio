import 'package:flutter/cupertino.dart';

class ContractSection extends StatelessWidget {
  const ContractSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("contract")
        ],
      ),
    );
  }

}