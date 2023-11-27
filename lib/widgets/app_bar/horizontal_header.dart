import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/app_bar/header_btn.dart';

import '../../bloc/test_bloc/test_event.dart';

class HorizontalHeader extends StatefulWidget {
  const HorizontalHeader({super.key});

  @override
  State<HorizontalHeader> createState() => _HorizontalHeaderState();
}

class _HorizontalHeaderState extends State<HorizontalHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            if (state is TestInitial) {
              context.read<TestBloc>().add(TestAction());
              return const Text("...loading");
            }
            if (state is TestApiProvider) {
              List<String> headerNames = state.headerNames;
              return DeviceType.desktop.deviceType(
                  context,
                  Container(),
                  Row(
                    children: List.generate(
                        headerNames.length,
                        (index) => HeaderBtn(
                              headerIndex: index,
                              headerNames: headerNames,
                            )),
                  ));
            }
            return Container();
          },
        ),
      ],
    );
  }
}
