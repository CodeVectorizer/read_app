import 'package:flutter/material.dart';
import 'package:read_app/pages/library1_page.dart';
import 'package:read_app/pages/library_page.dart';
import 'package:read_app/pages/login.dart';
// import 'package:read_app/pages/login_page.dart';
import 'package:read_app/pages/home_page.dart';
import 'package:read_app/pages/login_page_.dart';
import 'package:read_app/pages/profile_page.dart';
import 'package:read_app/pages/register_page.dart';
import 'package:read_app/pages/summary1_page.dart';
import 'package:read_app/pages/summary_home.dart';
import 'package:read_app/pages/writing1_page.dart';
import 'package:read_app/pages/writing_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffd9d9d9)),
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/summary1': (context) => Summary1Page(),
        '/summaryhome': (context) => SummaryHomePage(),
        '/writing1': (context) => Writing1Page(),
        '/writinghome': (context) => WritingHomePage(),
        '/library': (context) => LibraryPage(),
        '/library1': (context) => Library1Page(),
      },
    );
  }
}
