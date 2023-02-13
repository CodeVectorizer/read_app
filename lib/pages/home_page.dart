import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 0),
          children: [
            title(),
            button(),
            button2(),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ReadMe',
            style: blackTextStyle.copyWith(
              fontSize: 26,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return Container(
      margin: EdgeInsets.only(top: 110),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 120,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              style: TextButton.styleFrom(
                backgroundColor: ContentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Text(
                'Profile',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 120,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/library');
              },
              style: TextButton.styleFrom(
                backgroundColor: ContentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Text(
                'Library',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button2() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 120,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/writing1');
              },
              style: TextButton.styleFrom(
                backgroundColor: ContentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Text(
                'Writing',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 120,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/summary1');
              },
              style: TextButton.styleFrom(
                backgroundColor: ContentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Text(
                'Summary',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
