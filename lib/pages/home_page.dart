import 'package:flutter/material.dart';
import 'package:read_app/components/title_text_component.dart';

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
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 0),
          children: [
            logo(),
            TitleTextComponent(
              text: 'Menu',
              isCenter: true,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                padding: EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 10,
                children: [
                  ButtonMenu(
                    name: 'Profile',
                    image: 'assets/images/menu-profile.png',
                    routeName: '/profile',
                  ),
                  ButtonMenu(
                    name: 'Library',
                    image: 'assets/images/menu-library.png',
                    routeName: '/library',
                  ),
                  ButtonMenu(
                    name: 'Summary',
                    image: 'assets/images/menu-summary.png',
                    routeName: '/summary',
                  ),
                  ButtonMenu(
                    name: 'Writing',
                    image: 'assets/images/menu-writing.png',
                    routeName: '/writing',
                  ),
                ],
              ),
            ),
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
}

class ButtonMenu extends StatelessWidget {
  String? image;

  String? routeName;
  String? name;

  ButtonMenu({
    Key? key,
    this.image,
    this.routeName,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName!);
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
              image!,
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name!,
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
