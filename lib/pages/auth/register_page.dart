import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/theme.dart';

import 'login_page_.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _numberPhoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _agencyController = TextEditingController();

  _postData() async {
    Map data = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'number_phone': _numberPhoneController.text,
      'address': _addressController.text,
      'agency': _agencyController.text
    };
    CallApi().postData("register", data).then((response) async {
      var jsonData = await json.decode(response.body);

      if (jsonData['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message']),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            logo(),
            title(),
            email(),
            telephoneEmail(),
            nama(),
            katasandi(),
            showpassword(),
            daftarButton(),
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
            'Daftar',
            style: blackTextStyle.copyWith(
              fontSize: 36,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget email() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration.collapsed(
          hintText: 'Email',
          hintStyle: fontTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
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
        controller: _numberPhoneController,
        decoration: InputDecoration.collapsed(
          hintText: 'No Telephone',
          hintStyle: fontTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      ),
    );
  }

  Widget nama() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration.collapsed(
          hintText: 'Nama',
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
              controller: _passwordController,
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

  Widget daftarButton() {
    return Container(
      margin: EdgeInsets.only(top: 34),
      height: 43,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          _postData();
        },
        style: TextButton.styleFrom(
          backgroundColor: AccentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Text(
          'Daftar',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
