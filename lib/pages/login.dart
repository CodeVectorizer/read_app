import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/user_model.dart';
import 'package:read_app/pages/home_page.dart';
import 'package:read_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _login() {
    var data = {
      'email': _usernameController.text,
      'password': _passwordController.text,
    };
    CallApi().postData("login", data).then((response) async {
      var jsonData = await json.decode(response.body);
      if (jsonData['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message']),
          ),
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('token', jsonData['token']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message']),
          ),
        );
      }
    });
  }

  loginCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlockColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 116),
                width: 206,
                height: 214,
              ),
              const SizedBox(
                height: 54,
              ),
              // make textfield with icon bg white
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.highlight_remove_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true),
              SizedBox(height: 56),
              // make button primary
              TextButton(
                child: Text("Log In"),
                onPressed: _login,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ContentColor),
                  ),
                  SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    child: Text(
                      "Sign up here",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ContentColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
