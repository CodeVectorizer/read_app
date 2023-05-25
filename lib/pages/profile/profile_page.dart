import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/student_model.dart';
import 'package:read_app/pages/auth/login_page_.dart';
import 'package:read_app/pages/my_summary/my_summary_page.dart';
import 'package:read_app/pages/my_writing/my_writing.dart';
import 'package:read_app/theme.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:read_app/utils/check_token.dart';
import 'package:read_app/utils/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  StudentModel student = StudentModel();

  bool isLoading = true;
  bool _loading = false;
  double? _progressValue;

  fetchData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? studentId = preferences.get('student_id').toString();
    if (await isTokenExpired()) {
      signOut();
    }
    CallApi().getData('students/$studentId').then((response) async {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        setState(() {
          student = StudentModel.fromJson(jsonData['data']);
        });
        setState(() {
          isLoading = false;
          _progressValue = student.point?.toDouble();
          print(_progressValue);
        });
      } else {
        print(jsonData['message']);
      }
    });
  }

  void signOut() async {
    setState(() {
      _loading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  isSessionExpired: false,
                )),
        (route) => false);
  }

  @override
  void initState() {
    _loading = true;
    _progressValue = 0.0;
    if (mounted) fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          fetchData();
        },
        child: Scaffold(
          backgroundColor: MainColor,
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              TitleTextComponent(
                text: 'My Profile',
              ),
              profile(),
            ],
          ),
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
          Container(
            height: 160,
            width: 160,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            student.user?.name ?? '',
            style: fontTextStyle.copyWith(
              fontSize: 20,
              fontWeight: regular,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      minHeight: 20,
                      backgroundColor: BlockColor,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(AccentColor),
                      value: _progressValue! / 100,
                    ),
                  ),
                  Text(_progressValue!.toInt().toString() + ' Point'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Accumulation',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
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
              'Point : ${student.point}',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
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
            margin: EdgeInsets.only(bottom: 10),
            child: TextButton(
              onPressed: () {
                signOut();
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
