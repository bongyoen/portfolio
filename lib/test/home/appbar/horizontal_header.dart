import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/scroll_bloc/home_scroll_bloc.dart';
import '../../bloc/scroll_bloc/home_scroll_state.dart';
import 'header_btn.dart';

class HorizontalHeader extends StatelessWidget {
  const HorizontalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScrollBloc, HomeScrollState>(
      builder: (context, state) {
        if (state is HomeScrollInitial) return Container();

        return Row(
          children: List.generate(
              state.headerNames.length,
              (index) => HeaderBtn(
                    headerIndex: index,
                    headerNames: state.headerNames,
                  )),
        );
      },
    );
  }
}
