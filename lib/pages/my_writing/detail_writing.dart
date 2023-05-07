import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/book_model.dart';
import 'package:read_app/models/writing_model.dart';
import 'package:read_app/theme.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:http/http.dart' as http;
import 'package:read_app/utils/get_image.dart';

class DetailWritingPage extends StatefulWidget {
  final int? Writing_id;
  DetailWritingPage({super.key, required this.Writing_id});

  @override
  State<DetailWritingPage> createState() => _DetailWritingPageState();
}

class _DetailWritingPageState extends State<DetailWritingPage> {
  var writing = WritingModel();

  File? file;
  var isLoading = true;

  fetchData(int? Writing_id) async {
    CallApi().getData('writings/$Writing_id').then((response) async {
      var jsonData = json.decode(response.body);
      print(jsonData);
      if (jsonData['success']) {
        setState(() {
          writing = WritingModel.fromJson(jsonData['data']);
        });

        String url = "$writing.file";
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
          isLoading = false;
        });
      } else {
        print(jsonData['message']);
      }
    });
  }

  @override
  void initState() {
    fetchData(widget.Writing_id);
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
                  if (writing.cover != null) {
                    return Image.network(
                      writing.cover!,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
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
                text: writing.title ?? '',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                writing.content ?? '',
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
            'Writing',
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
