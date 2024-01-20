import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/widgets/body/map/portfolio_box.dart';

import '../../../bloc/board_bloc/board_bloc.dart';
import '../../../bloc/board_bloc/board_state.dart';
import '../../../core/utils/app_styles.dart';

class PortfolioInfo extends StatelessWidget {
  const PortfolioInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardBloc, BoardState>(
      builder: (context, state) {
        if (state is BoardInitial) return Container();

        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 600),
          child: Padding(
            padding: AppPadStyles.p30t,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(state.hmc003List.length, (index) => PortfolioBox(hmc003Item: state.hmc003List[index]))
            ),
          ),
        );
      },
    );
  }
}
