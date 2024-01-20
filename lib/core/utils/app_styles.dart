import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTxtStyles {
  static TextStyle s28 = TextStyle(
    color: AppColors.lightColor,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static TextStyle s16 = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle s15black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );
  static TextStyle s18black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s20black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s20blue = TextStyle(
    color: AppColors.blueColor,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static TextStyle sLink = TextStyle(
    color: AppColors.linkColor,
  );
  static TextStyle s25black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s35black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 35,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s40black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 40,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s50black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 50,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s60black = TextStyle(
    color: AppColors.darkColor,
    fontSize: 60,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s60orange = TextStyle(
    color: AppColors.orangeColor,
    fontSize: 60,
    fontWeight: FontWeight.w500,
  );
}

abstract class AppPadStyles {
  static EdgeInsets p80b = const EdgeInsets.only(bottom: 80);
  static EdgeInsets p10b = const EdgeInsets.only(bottom: 30);
  static EdgeInsets p50t50b = const EdgeInsets.only(top: 50, bottom: 50);
  static EdgeInsets p50t80b = const EdgeInsets.only(top: 50, bottom: 80);
  static EdgeInsets p10l = const EdgeInsets.only(left: 10);
  static EdgeInsets p10t = const EdgeInsets.only(top: 10);
  static EdgeInsets p10t10b = const EdgeInsets.only(top: 10, bottom: 10);
  static EdgeInsets p12t = const EdgeInsets.only(top: 12);
  static EdgeInsets p15t = const EdgeInsets.only(top: 15);
  static EdgeInsets p30t = const EdgeInsets.only(top: 30);
  static EdgeInsets p10t15r25b =
      const EdgeInsets.only(top: 10, right: 15, bottom: 25);
}

abstract class AppLoadStyle {
  static Container sktH30 = Container(
    height: 30,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(12)),
  );
  static Container sktH100W100 = Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(12)),
  );
  static Container sktH400W300 = Container(
    height: 275,
    width: 200,
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(12)),
  );
  static Row sktH100W100P10r = Row(
    children: [sktH100W100, Padding(padding: AppPadStyles.p10l)],
  );
  static List<Widget> sktH30P12t = [
    sktH30,
    Padding(padding: AppPadStyles.p12t)
  ];
  static ClipRRect profileImg = ClipRRect(
    borderRadius: BorderRadius.circular(2000),
    child: sktH400W300,
  );
}
