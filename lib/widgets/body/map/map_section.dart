import 'package:flutter/material.dart';
import 'package:portfolio/widgets/body/map/sitemap_section.dart';
import 'package:portfolio/widgets/cmmn/section_widget.dart';

import '../../../core/utils/app_strings.dart';
import '../../cmmn/title_widget.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionWidget(
        children: [TitleText(title: AppStrings.portfolio), SiteMapSection()]);
  }
}
