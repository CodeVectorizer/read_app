import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BlockComponent extends StatelessWidget {
  const BlockComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          height: 200.0,
          viewportFraction: 1),
      items: [
        'slide1.jpg',
        'slide2.jpg',
        'slide3.jpg',
        'slide4.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Image.asset(
                'assets/images/slides/$i',
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
              // padding: EdgeInsets.all(14),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
