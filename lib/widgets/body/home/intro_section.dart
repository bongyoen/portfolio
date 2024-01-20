import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/core/utils/app_styles.dart';

import 'package:universal_html/html.dart' as html;

import '../../../core/utils/web_url.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.developerName, style: AppTxtStyles.s40black),
              Text(AppStrings.homeIntroTxt, style: AppTxtStyles.s40black),
              Container(
                padding: AppPadStyles.p30t,
                width: double.maxFinite,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: AppPadStyles.p50t50b,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: [
                            const DataRow(cells: [
                              DataCell(Text(AppStrings.emailTitle)),
                              DataCell(Text(
                                WebUrl.email,
                                style:
                                    TextStyle(decoration: TextDecoration.none),
                              )),
                            ]),
                            DataRow(cells: [
                              const DataCell(Text(AppStrings.githubTitme)),
                              DataCell(TextButton(
                                child: const Text(WebUrl.github),
                                onPressed: () {
                                  html.window
                                      .open(WebUrl.github, "_blank");
                                },
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Container()),
                              DataCell(Container()),
                            ]),
                          ],
                        )),
                    StreamBuilder(
                      stream: context.read<TestBloc>().todoList,
                      builder: (_, snapshot) {
                        if (snapshot.data == null) {
                          return AppLoadStyle.profileImg;
                        }

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(2000),
                          child: Image.network(
                              cacheWidth: 50,
                              cacheHeight: 50,
                              width: 200,
                              snapshot.data!,
                              fit: BoxFit.fitWidth, loadingBuilder:
                                  (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return AppLoadStyle.sktH400W300;
                          }), // Text(key['title']),
                        );
                      },
                    ),
                    const SizedBox()
                  ],
                ),
              )
            ],
          ),
          // const SizedBox(),
        ],
      );
}
