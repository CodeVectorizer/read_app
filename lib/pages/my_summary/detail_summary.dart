import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/book_model.dart';
import 'package:read_app/models/summary_model.dart';
import 'package:read_app/pages/auth/login_page_.dart';
import 'package:read_app/theme.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:http/http.dart' as http;
import 'package:read_app/utils/check_token.dart';
import 'package:read_app/utils/get_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailSummaryPage extends StatefulWidget {
  final int? summary_id;
  DetailSummaryPage({super.key, required this.summary_id});

  @override
  State<DetailSummaryPage> createState() => _DetailSummaryPageState();
}

class _DetailSummaryPageState extends State<DetailSummaryPage> {
  BookModel book = BookModel();
  var summary = SummaryModel();

  File? file;
  var isLoading = true;

  fetchData(int? summary_id) async {
    if (await isTokenExpired()) {
      signOut();
    }
    CallApi().getData('summaries/$summary_id').then((response) async {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        setState(() {
          book = BookModel.fromJson(jsonData['data']);
        });

        String url = "$book.file";
        // final http.Response response = await http.get(Uri.parse(book?.file));
        final bytes = response.bodyBytes;

        String filename = basename(url);
        final dir = await getApplicationDocumentsDirectory();
        File file = File('${dir.path}/$filename');
        await file.writeAsBytes(bytes, flush: true);

        setState(() {
          file = file;
        });

        setState(() {
          summary = SummaryModel.fromJson(jsonData['data']);
          isLoading = false;
        });
      } else {
        print(jsonData['message']);
      }
    });
  }

  void signOut() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushAndRemoveUntil(context as BuildContext,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  @override
  void initState() {
    if (mounted) fetchData(widget.summary_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: getImgUrl(null),
                builder: (context, snapshot) {
                  if (summary.book?.cover != null) {
                    return Image.network(
                      summary.book?.cover ?? '',
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    );
                  }
                  return Center(
                      child: Image.asset(
                    'assets/images/no-image-square.png',
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ));
                },
              ),
              SizedBox(
                height: 30,
              ),
              TitleTextComponent(
                text: 'Summarize of ${summary.book?.title ?? '-'}',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                summary.content ?? '',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
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
}
