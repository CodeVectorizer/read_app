import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class SummaryHomePage extends StatefulWidget {
  const SummaryHomePage({super.key});

  @override
  State<SummaryHomePage> createState() => _SummaryHomePageState();
}

class _SummaryHomePageState extends State<SummaryHomePage> {
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
            'Summary',
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
              padding: EdgeInsets.only(top: 10, left: 80),
              child: Text(
                'Tugas Summary 1 test test test asdf test etst etsa aweeta',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.left,
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
                'Tugas Summary 2',
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
