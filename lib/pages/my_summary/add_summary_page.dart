import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/components/button_submit_component.dart';
import 'package:read_app/components/text_form_field_component.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/book.dart';
import 'package:read_app/models/book_model.dart';
import 'package:read_app/pages/my_summary/my_summary_page.dart';
import 'package:http/http.dart' as http;
import 'package:read_app/theme.dart';
// import title_text.dart
import 'package:read_app/components/title_text_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSummaryPage extends StatefulWidget {
  final int? book_id;
  AddSummaryPage({super.key, this.book_id});

  @override
  State<AddSummaryPage> createState() => _AddSummaryPageState();
}

class _AddSummaryPageState extends State<AddSummaryPage> {
  TextEditingController judulController = TextEditingController();
  TextEditingController kontenController = TextEditingController();

  BookModel book = BookModel();
  bool isLoading = true;

  _postData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? studentId = preferences.get('student_id').toString();

    var data = {
      'title': judulController.text,
      'book_id': widget.book_id,
      'student_id': studentId,
      'content': kontenController.text,
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
          MaterialPageRoute(builder: (context) => MySummaryPage()),
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

  fetchData(int? book_id) async {
    CallApi().getData('books/$book_id').then((response) async {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        setState(() {
          book = BookModel.fromJson(jsonData['data']);
          isLoading = false;
        });
      } else {
        print(jsonData['message']);
      }
    });
  }

  void initState() {
    super.initState();
    fetchData(widget.book_id);
  }

  @override
  Widget build(BuildContext context) {
    print(book);
    return Scaffold(
      backgroundColor: MainColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            TitleTextComponent(
              text: 'Summary',
            ),
            TextFormFieldComponent(
              textEditingController: judulController,
              text: 'Judul',
            ),
            TextFormFieldComponent(
              textEditingController: kontenController,
              text: 'Konten',
              isTextArea: true,
            ),
            ButtonSubmitComponent(
              text: 'Submit',
              onPressed: _postData,
            ),
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
