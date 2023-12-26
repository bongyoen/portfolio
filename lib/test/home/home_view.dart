import 'package:flutter/material.dart';
import 'package:portfolio/test/home/body/body.dart';

import 'appbar/appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: Appbar(),
    body: Body(),
  );

}