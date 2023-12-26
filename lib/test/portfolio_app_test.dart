import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/test/bloc/appbar_bloc/appbar_bloc.dart';
import 'package:portfolio/test/bloc/body_bloc/body_bloc.dart';
import 'package:portfolio/test/bloc/scroll_bloc/home_scroll_bloc.dart';
import 'package:portfolio/test/home/home_view.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'Beyondi',
        home: MultiBlocProvider(providers: [
          BlocProvider<AppbarBloc>(
            create: (context) => AppbarBloc(),
          ),
          BlocProvider<BodyBloc>(
            create: (context) => BodyBloc(),
          ),
          BlocProvider<HomeScrollBloc>(
            create: (context) => HomeScrollBloc(),
          ),
        ], child: const HomeView()),
      );
}
