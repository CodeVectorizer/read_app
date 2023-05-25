import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:read_app/pages/auth/login_page_.dart';
import 'package:shared_preferences/shared_preferences.dart';

void signOut() async {
  await Future.delayed(Duration(seconds: 3));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  // Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
}
