import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/views/home_view.dart';

import 'bloc/board_bloc/board_bloc.dart';
import 'bloc/email_bloc/email_bloc.dart';
import 'bloc/scroll_bloc/home_scroll_bloc.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Beyondi',
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
      ], child: const HomeView()),
    );
  }
}
