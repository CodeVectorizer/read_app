import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/components/content_list_item_component.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/writing_model.dart';
import 'package:read_app/theme.dart';

class MyWritingPage extends StatefulWidget {
  const MyWritingPage({super.key});

  @override
  State<MyWritingPage> createState() => _MyWritingPageState();
}

class _MyWritingPageState extends State<MyWritingPage> {
  var writings = <WritingModel>[];
  var isLoading = true;
  // method
  fetchData() {
    CallApi().getData('writings').then((response) {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        Iterable list = jsonData['data'];

        setState(() {
          writings = list.map((model) => WritingModel.fromJson(model)).toList();
          isLoading = false;
        });
      } else {
        print(jsonData['message']);
      }
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
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
              text: 'My Writings',
            ),
            block(),
            this.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: writings.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ContentListItemComponent(
                        title: writings[index].title,
                        image: writings[index].cover,
                        description: writings[index].description,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: writings[index],
                          );
                        },
                      );
                    }),
          ],
        ),
      ),
    );
  }

  Widget block() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.all(14),
      height: 120,
      decoration: BoxDecoration(
        color: ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }
}
