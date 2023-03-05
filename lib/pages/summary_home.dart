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
      backgroundColor: MainColor,
      body: SafeArea(
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 24), children: [
          title(),
          block(),
          content1(),
        ]),
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
              fontSize: 36,
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
        color: AccentColor,
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
              padding: EdgeInsets.only(top: 10, left: 96),
              child: Text(
                'Burung Ajaib',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.left,
              ),
              margin: EdgeInsets.only(left: 46),
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
                  color: AccentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Image.asset(
                  'assets/images/content-2.png',
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
