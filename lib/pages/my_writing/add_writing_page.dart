import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:read_app/components/text_form_field_component.dart';
import 'package:read_app/components/button_submit_component.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/pages/auth/login_page_.dart';
import 'package:read_app/pages/my_summary/my_summary_page.dart';
import 'package:read_app/pages/my_writing/choose_writing_category_page.dart';
import 'package:read_app/pages/my_writing/my_writing.dart';
import 'package:read_app/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:read_app/utils/check_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddWritingPage extends StatefulWidget {
  final String? category;
  const AddWritingPage({super.key, this.category});

  @override
  State<AddWritingPage> createState() => _AddWritingPageState();
}

class _AddWritingPageState extends State<AddWritingPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  _postData() async {
    if (await isTokenExpired()) signOut();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? studentId = preferences.get('student_id').toString();

    Map<String, String> data = {
      'title': _titleController.text,
      'student_id': studentId,
      'content': _contentController.text,
      'category': widget.category!,
      'description': _descriptionController.text,
    };
    CallApi().postData("writings", data).then((Response response) async {
      Map jsonData = await json.decode(response.body);

      if (jsonData.containsKey('success')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message']),
          ),
        );
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => MyWritingPage()),
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

  void signOut() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
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
              text: 'Add Writing',
            ),
            TextFormFieldComponent(
              textEditingController: _titleController,
              text: 'Judul',
            ),
            TextFormFieldComponent(
              textEditingController: _contentController,
              text: 'Konten',
              isTextArea: true,
            ),
            TextFormFieldComponent(
              textEditingController: _descriptionController,
              text: 'Deskripsi',
              isTextArea: true,
            ),
            ButtonSubmitComponent(text: 'Submit', onPressed: _postData)
          ],
        ),
      ),
    );
  }
}
