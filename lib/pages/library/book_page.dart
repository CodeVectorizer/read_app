import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:http/http.dart' as http;
import 'package:read_app/models/book_model.dart';
import 'package:read_app/pages/my_summary/add_summary_page.dart';
import 'package:read_app/theme.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_app/utils/get_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookPage extends StatefulWidget {
  final int? book_id;
  const BookPage({super.key, required this.book_id});

  @override
  State<BookPage> createState() => Book_PageState();
}

class Book_PageState extends State<BookPage> {
  var book = BookModel();

  File? Pfile;
  var isLoading = true;

  fetchData(int? book_id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? studentId = preferences.get('student_id').toString();

    CallApi().getData('books/$book_id/$studentId').then((response) async {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        setState(() {
          book = BookModel.fromJson(jsonData['data']);
        });

        String url = "$book.file";
        final http.Response response = await http.get(Uri.parse(book.file!));
        final bytes = response.bodyBytes;

        String filename = basename(url);
        final dir = await getApplicationDocumentsDirectory();
        File file = File('${dir.path}/$filename');
        await file.writeAsBytes(bytes, flush: true);

        setState(() {
          Pfile = file;
        });

        setState(() {
          isLoading = false;
        });
      } else {
        print(jsonData['message']);
      }
    });
  }

  @override
  void initState() {
    fetchData(widget.book_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: book.is_read == false,
        child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddSummaryPage(
                            book_id: book.id,
                          )));
            },
            backgroundColor: AccentColor,
            child: Icon(
              Icons.check,
              color: MainColor,
            )),
      ),
      backgroundColor: BackgroundReadColor,
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Container(
                  child: PDFView(
                    filePath: Pfile?.path,
                  ),
                ),
              ),
      ),
    );
  }

  Widget finishButton() {
    return Container(
      margin: EdgeInsets.only(top: 34),
      height: 43,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/home');
        },
        style: TextButton.styleFrom(
          backgroundColor: AccentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Text(
          'Finish',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            color: MainColor,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
