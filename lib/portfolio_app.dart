import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/home_bloc/home_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/views/home_view.dart';

import 'bloc/board_bloc/board_bloc.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Beyondi',
      home: MultiBlocProvider(providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<TestBloc>(
          create: (context) => TestBloc(),
        ),
        BlocProvider<BoardBloc>(
          create: (context) => BoardBloc(),
        ),
      ], child: const HomeView()),
      // home: BlocProvider<HomeBloc>(
      //   create: (context) => HomeBloc(),
      //   child: const HomeView(),
      // ),
    );
  }
}
