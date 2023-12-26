import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/bloc/scroll_bloc/home_scroll_state.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/widgets/body/career_section.dart';
import 'package:portfolio/widgets/body/contract_section.dart';

import '../app_bar/vertical_menu_cross_fade.dart';
import 'about_me_section.dart';
import 'home_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScrollBloc, HomeScrollState>(
      builder: (context, state) {
        return Stack(
          children: [
            _loadingWidget(
                controller: controller, state: state, context: context)
          ],
        );
      },
    );
  }

  Widget _loadingWidget(
      {required ScrollController controller,
      required HomeScrollState state,
      required BuildContext context}) {
    if (state is HomeScrollInitial) return Container();

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .08),
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                HomeSection(key: state.headerNameKeys[0]),
                AboutMeSection(key: state.headerNameKeys[1]),
                CareerSection(key: state.headerNameKeys[2]),
                ContractSection(key: state.headerNameKeys[3]),
              ],
            ),
          ),
        ),
        const VerticalMenuCrossFade()
      ],
    );
  }

  Future<void> _neverSatisfied(BuildContext context) async {
    return showDialog<void>(
      //다이얼로그 위젯 소환
      context: context,
      barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('제목'),
          content: const SingleChildScrollView(
            child: ListBody(
              //List Body를 기준으로 Text 설정
              children: <Widget>[
                Text('Alert Dialog 입니다'),
                Text('OK를 눌러 닫습니다'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
