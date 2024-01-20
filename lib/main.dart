import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/skill_bloc/skill_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';

import 'bloc/board_bloc/board_bloc.dart';
import 'bloc/email_bloc/email_bloc.dart';
import 'bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/widgets/body/body.dart';

import 'widgets/app_bar/home_app_bar.dart';
// import 'core/utils/bloc_observer.dart';
import 'core/utils/app_strings.dart';

void main() {
  // Bloc.observer = MyBlocObserver();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: AppStrings.developerName,
      home: MultiBlocProvider(providers: [
        BlocProvider<TestBloc>(
          create: (context) => TestBloc(),
        ),
        BlocProvider<BoardBloc>(
          create: (context) => BoardBloc(),
        ),
        BlocProvider<HomeScrollBloc>(
          create: (context) => HomeScrollBloc(),
        ),
        BlocProvider<EmailBloc>(
          create: (context) => EmailBloc(),
        ),
        BlocProvider<SkillBloc>(
          create: (context) => SkillBloc(),
        ),
      ], child: const Scaffold(appBar: HomeAppBar(), body: Body())),
    );
  }
}
