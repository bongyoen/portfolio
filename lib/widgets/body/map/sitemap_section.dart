import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/widgets/body/map/map_image.dart';
import 'package:portfolio/widgets/body/map/portfolio_info.dart';

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
