import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/text/white-normal-txt.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key, required this.items});

  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
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
          const WhiteNormalTxt(txt: "Skill", size: 30, color: Colors.white),
          CarouselSlider.builder(
            itemCount: items.length,
            options:
            CarouselOptions(autoPlay: true, height: 180, viewportFraction: 0.15),
            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                  width: 120,
                  child: carouseEq(items[index]['image']!, items[index]['name']!)
              );
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
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       Image.asset(path,width: 100,),
       WhiteNormalTxt(txt: txt, size: 20, color: Colors.white)
     ],
  );
}
