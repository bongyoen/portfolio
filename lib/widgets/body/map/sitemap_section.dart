import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/widgets/body/map/map_image.dart';
import 'package:portfolio/widgets/body/map/portfolio_info.dart';

import '../../../bloc/board_bloc/board_bloc.dart';
import '../../../bloc/board_bloc/board_state.dart';
import '../../../bloc/test_bloc/test_bloc.dart';
import '../../../bloc/test_bloc/test_state.dart';
import '../home/home_section.dart';

class SiteMapSection extends StatelessWidget {
  const SiteMapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPadStyles.p30t,
          child: Text(
            AppStrings.howMake,
            style: AppTxtStyles.s50black,
          ),
        ),
        Text(
          AppStrings.portfolioTitle,
          style: AppTxtStyles.s20black,
        ),
        const MapImage(),
        const PortfolioInfo()
      ],
    );
  }
}
