import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/book_model.dart';
import 'package:read_app/pages/auth/login_page_.dart';
import 'package:read_app/pages/library/book_page.dart';
import 'package:read_app/theme.dart';
import 'package:read_app/components/title_text_component.dart';
import 'package:read_app/components/content_list_item_component.dart';
import 'package:read_app/components/block_component.dart';
import 'package:read_app/utils/check_token.dart';
import 'package:read_app/utils/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  var books = <BookModel>[];
  var isLoading = true;

  fetchData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? studentId = preferences.get('student_id').toString();
    if (await isTokenExpired()) {
      signOut();
    }
    CallApi().getData('books/$studentId/all').then((response) {
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

  void signOut() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  @override
  void initState() {
    if (mounted) fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor,
      body: RefreshIndicator(
        onRefresh: () => fetchData(),
        child: SafeArea(
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
                        print(books[index].is_read);
                        return ContentListItemComponent(
                          title: books[index].title,
                          image: books[index].cover,
                          description: books[index].description,
                          isRead: books[index].is_read,
                          status: books[index].author,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BookPage(book_id: books[index].id),
                                ));
                          },
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
