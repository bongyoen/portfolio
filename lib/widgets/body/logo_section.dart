import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_bloc.dart';
import 'package:portfolio/bloc/test_bloc/test_state.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key, required this.items});

  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        if (state is TestApiProvider) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
                width: 5.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WhiteNormalTxt(
                    txt: "SKILL", size: 40, color: Colors.white),
                CarouselSlider.builder(
                  itemCount: state.skillLogos.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 180,
                    viewportFraction: 0.30,
                    autoPlayInterval: const Duration(milliseconds: 1800),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return carouseEq(state.skillLogos[index]['image']!,
                        state.skillLogos[index]['name']!);
                  },
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepPurple,
          width: 5.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WhiteNormalTxt(txt: "SKILL", size: 40, color: Colors.white),
          CarouselSlider.builder(
            itemCount: items.length,
            options: CarouselOptions(
              autoPlay: true,
              height: 180,
              viewportFraction: 0.30,
              autoPlayInterval: const Duration(milliseconds: 1800),
            ),
            itemBuilder: (context, index, realIndex) {
              return carouseEq(items[index]['image']!, items[index]['name']!);
            },
          )
        ],
      ),
    );
  }
}

Widget carouseEq(String path, String txt) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Image.network(path, height: 100),
      ),
      WhiteNormalTxt(txt: txt, size: 20, color: Colors.white)
    ],
  );
}
