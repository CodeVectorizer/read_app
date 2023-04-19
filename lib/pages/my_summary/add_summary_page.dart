import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/pages/my_summary/my_summary_home_page.dart';
import 'package:read_app/pages/summary/summary_home.dart';
import 'package:read_app/theme.dart';
// import title_text.dart
import 'package:read_app/components/title_text_component.dart';

class AddSummaryPage extends StatefulWidget {
  final String? category;
  AddSummaryPage({super.key, this.category});

  @override
  State<AddSummaryPage> createState() => _AddSummaryPageState();
}

class _AddSummaryPageState extends State<AddSummaryPage> {
  TextEditingController judulController = TextEditingController();
  TextEditingController kontenController = TextEditingController();

  _postData() {
    var data = {
      'title': judulController.text,
      'book_id': 1,
      'student_id': 1,
      'content': kontenController.text,
      'category': widget.category,
    };
    CallApi().postData("summaries", data).then((response) async {
      print(response.body);

      Map jsonData = await json.decode(response.body);

      if (jsonData.containsKey('success')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message']),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MySummaryHomePage()),
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
            TitleTextComponent(
              text: 'Summary',
            ),
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
            'Summary',
            style: blackTextStyle.copyWith(
              fontSize: 36,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget judul() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        controller: judulController,
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
        maxLines: null,
        controller: kontenController,
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
          // Navigator.pushNamed(context, '/summaryhome');
          _postData();
        },
        style: TextButton.styleFrom(
          backgroundColor: AccentColor,
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
