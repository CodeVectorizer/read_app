import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/book_model.dart';
import 'package:read_app/pages/library/read_book.dart';
import 'package:read_app/theme.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:read_app/components/content_list_item_component.dart';
import 'package:read_app/components/block_component.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  // list variable
  var books = <BookModel>[];
  var isLoading = true;
  // method

  fetchData() {
    CallApi().getData('books').then((response) {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        Iterable list = jsonData['data'];
        setState(() {
          books = list.map((model) => BookModel.fromJson(model)).toList();

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
              text: 'Library',
            ),
            BlockComponent(),
            this.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: books.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ContentListItemComponent(
                        title: books[index].title,
                        image: books[index].cover,
                        description: books[index].description,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Library1Page(book_id: books[index].id),
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
