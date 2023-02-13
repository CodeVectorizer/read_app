import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class Writing1Page extends StatefulWidget {
  const Writing1Page({super.key});

  @override
  State<Writing1Page> createState() => _Writing1PageState();
}

class _Writing1PageState extends State<Writing1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            judul(),
            konten(),
            btnkirim(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Writing',
            style: blackTextStyle.copyWith(
              fontSize: 30,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget judul() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: 'Judul',
          hintStyle: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }

  Widget konten() {
    return Container(
      margin: EdgeInsets.only(top: 18),
      padding: EdgeInsets.all(14),
      height: 250,
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: 'Konten',
          hintStyle: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }

  Widget btnkirim() {
    return Container(
      margin: EdgeInsets.only(top: 18),
      height: 43,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/writinghome');
        },
        style: TextButton.styleFrom(
          backgroundColor: ButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Text(
          'Kirim',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
