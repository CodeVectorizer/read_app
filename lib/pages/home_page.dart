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
      backgroundColor: MainColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 0),
          children: [
            logo(),
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

  Widget logo() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 207,
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Menu',
            style: blackTextStyle.copyWith(
              fontSize: 36,
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
                backgroundColor: AccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/menu-profile.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Profile',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
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
                backgroundColor: AccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/menu-library.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Library',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
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
                Navigator.pushNamed(context, '/writinghome');
              },
              style: TextButton.styleFrom(
                backgroundColor: AccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/menu-writing.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Writing',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
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
                Navigator.pushNamed(context, '/summaryhome');
              },
              style: TextButton.styleFrom(
                backgroundColor: AccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/menu-summary.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Summary',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
