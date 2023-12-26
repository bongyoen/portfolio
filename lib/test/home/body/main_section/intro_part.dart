import 'package:flutter/cupertino.dart';

import '../../../core/util/app_style.dart';

class IntroPart extends StatelessWidget {
  const IntroPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("안녕하세요 저는", style: AppStyle.ts25w600),
              Row(
                children: [
                  Text("김봉연 ", style: AppStyle.ts40w600),
                  Text("이라고 합니다", style: AppStyle.ts16w600),
                ],
              ),
              Text("웹을 만드는 개발자입니다.", style: AppStyle.ts16w600),
            ],
          ),
          Container()
        ],
      ),
    );
  }
}