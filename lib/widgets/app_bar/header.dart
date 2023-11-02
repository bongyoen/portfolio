import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/home_bloc/home_bloc.dart';
import 'package:portfolio/bloc/home_bloc/home_state.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/widgets/app_bar/header_btn.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children: List.generate(AppBarHeaders.values.length,
              (index) => HeaderBtn(headerIndex: index)),
        );
      },
    );
  }
}
