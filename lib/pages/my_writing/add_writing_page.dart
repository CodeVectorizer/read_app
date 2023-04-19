import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:read_app/components/text_form_field_component.dart';
import 'package:read_app/components/button_submit_component.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/pages/my_summary/my_summary_home_page.dart';
import 'package:read_app/pages/my_writing/choose_writing_category_page.dart';
import 'package:read_app/theme.dart';
import 'package:image_picker/image_picker.dart';

class AddWritingPage extends StatefulWidget {
  final String? category;
  const AddWritingPage({super.key, this.category});

  @override
  State<AddWritingPage> createState() => _AddWritingPageState();
}

class _AddWritingPageState extends State<AddWritingPage> {
  File? _image = null;
  PickedFile _imageFile = PickedFile('');

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // save to folder and get path

      setState(() {
        _image = File(pickedImage.path);
        _imageFile = PickedFile(pickedImage.path);
      });
    }
  }

  _postData() {
    Map<String, String> data = {
      'title': _titleController.text,
      'book_id': '1',
      'student_id': '1',
      'content': _contentController.text,
      'category': widget.category!,
      'description': _descriptionController.text,
    };
    CallApi()
        .postMultipartData("writings", data, _imageFile)
        .then((Response response) async {
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
          MaterialPageRoute(builder: (context) => ChooseWritingCategoryPage()),
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
              text: 'Add Writing',
            ),
            GestureDetector(
              onTap: _openImagePicker,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Please select an image'),
              ),
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
