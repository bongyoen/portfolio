import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/app_bar/header_btn.dart';

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
        BlocBuilder<HomeScrollBloc, HomeScrollState>(
          builder: (context, state) {
            if (state is! HomeScrollInitial) {
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
