import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            profile(),
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
            'Profile',
            style: blackTextStyle.copyWith(
              fontSize: 26,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget profile() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 22,
          ),
          Image.asset(
            'assets/images/rusky.png',
            width: 110,
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            'Name User',
            style: fontTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: BlockColor,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Accumulation',
                style: fontTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 120,
            height: 32,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: BlockColor,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              'Point : 0',
              textAlign: TextAlign.center,
              style: fontTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 44,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: TextButton.styleFrom(
                backgroundColor: BlockColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Text(
                'Keluar',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
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
