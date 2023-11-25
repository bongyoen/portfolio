import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/home_bloc/home_bloc.dart';
import 'package:portfolio/bloc/home_bloc/home_state.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/app_bar/header_btn.dart';

import '../../bloc/test_bloc/test_event.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return DeviceType.desktop.widthType(
                context,
                Container(),
                Row(
                  children: List.generate(AppBarHeaders.values.length,
                      (index) => HeaderBtn(headerIndex: index)),
                ));
          },
        ),
        BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            print("실행횟수");
            if (state is TestInitial) {
              print("도달!");
              context.read<TestBloc>().add(TestAction());
              return const Text("...loading");
            }
            if (state is TestApiProvider) {
              Map<String, String> res = state.titleMap;
              String abc = res['hi']!;
              return Text(abc);
            }
            return const Text("1");
          },
        ),
      ],
    );
  }
}
