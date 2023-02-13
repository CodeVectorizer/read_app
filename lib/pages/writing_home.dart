import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class WritingHomePage extends StatefulWidget {
  const WritingHomePage({super.key});

  @override
  State<WritingHomePage> createState() => _WritingHomePageState();
}

class _WritingHomePageState extends State<WritingHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            block(),
            content1(),
            content2(),
            content3(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Writing',
            style: blackTextStyle.copyWith(
              fontSize: 30,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget block() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(14),
      height: 120,
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }

  Widget content1() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Artikel',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 45),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ContentColor,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          new Positioned(
            top: 15,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: ButtonColor,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content2() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Cerpen',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 45),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ContentColor,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          new Positioned(
            top: 15,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: ButtonColor,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content3() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Puisi',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 45),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ContentColor,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          new Positioned(
            top: 15,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: ButtonColor,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
