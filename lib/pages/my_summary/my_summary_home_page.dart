import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/components/block_component.dart';
import 'package:read_app/components/content_list_item_component.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/categories_model.dart';
import 'package:read_app/models/summary_model.dart';
import 'package:read_app/pages/my_summary/add_summary_page.dart';
import 'package:read_app/pages/my_summary/detail_summary.dart';
import 'package:read_app/theme.dart';

class MySummaryPage extends StatefulWidget {
  const MySummaryPage({Key? key}) : super(key: key);

  @override
  State<MySummaryPage> createState() => _MySummaryPageState();
}

class _MySummaryPageState extends State<MySummaryPage> {
  // list variable
  var summaries = <SummaryModel>[];
  var isLoading = true;
  // method

  fetchData() {
    CallApi().getData('summaries').then((response) {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        Iterable list = jsonData['data'];
        setState(() {
          summaries =
              list.map((model) => SummaryModel.fromJson(model)).toList();

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
              text: 'My Summary',
            ),
            BlockComponent(),
            this.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: summaries.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ContentListItemComponent(
                        title: summaries[index].book.title,
                        image: summaries[index].book.cover,
                        description: summaries[index].content,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailSummaryPage(),
                              ));
                        },
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
