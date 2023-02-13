import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            telephoneEmail(),
            katasandi(),
            showpassword(),
            loginButton(),
            signUp(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
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

  Widget telephoneEmail() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: 'No Telephone/Email',
          hintStyle: fontTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      ),
    );
  }

  Widget katasandi() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration.collapsed(
                hintText: 'Kata Sandi',
                hintStyle: fontTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
          // Icon(
          //   Icons.visibility_outlined,
          //   color: FontColor2,
          // ),
        ],
      ),
    );
  }

  Widget showpassword() {
    return Container(
      margin: EdgeInsets.only(top: 26),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: false,
              onChanged: (value) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            'Tampilkan Kata Sandi',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 34),
      height: 43,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        style: TextButton.styleFrom(
          backgroundColor: ContentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Text(
          'Masuk',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }

  Widget signUp() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Row(
        children: [
          Text(
            'Belum Punya Akun?',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Daftar',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
