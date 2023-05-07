import 'package:flutter/material.dart';
import 'package:read_app/pages/library/read_book.dart';
import 'package:read_app/pages/library/library_page.dart';
import 'package:read_app/pages/auth/login.dart';
// import 'package:read_app/pages/login_page.dart';
import 'package:read_app/pages/home_page.dart';
import 'package:read_app/pages/auth/login_page_.dart';
import 'package:read_app/pages/my_summary/my_summary_page.dart';
import 'package:read_app/pages/profile/profile_page.dart';
import 'package:read_app/pages/auth/register_page.dart';
import 'package:read_app/pages/my_summary/add_summary_page.dart';
import 'package:read_app/pages/summary/summary_home.dart';
import 'package:read_app/pages/my_writing/add_writing_page.dart';
import 'package:read_app/pages/my_writing/choose_writing_category_page.dart';
import 'package:read_app/pages/my_writing/my_writing.dart';
import 'package:read_app/pages/test_pdf_page.dart';

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
        '/add_summary': (context) => AddSummaryPage(),
        '/profile': (context) => ProfilePage(),
        '/summary': (context) => MySummaryPage(),
        '/library': (context) => LibraryPage(),
        '/writing': (context) => MyWritingPage(),
        '/my_summary': (context) => MySummaryPage(),
        '/add_writing': (context) => AddWritingPage(),
        // '/book': (context) => ReadBookPage(),
      },
      // home: summary(),
    );
  }
}
