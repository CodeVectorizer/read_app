import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/book_model.dart';
import 'package:read_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        print(list);
        // set state for list
        setState(() {
          // books = list.map((model) => BookModel.fromJson(model)).toList();
          // print('books: $books');

          isLoading = false;
        });
      } else {
        print(jsonData['message']);
      }

      // set state for isLoading
      // setState(() {
      //   isLoading = false;
      // });
    });
  }

  @override
  void initState() {
    print('initState()');
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
            title(),
            block(),
            this.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: books.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Content(
                        title: books[index].title,
                        image: books[index].cover,
                        description: books[index].description,
                      );
                    }),
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
            'Library',
            style: blackTextStyle.copyWith(
              fontSize: 36,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget block() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(14),
      height: 120,
      decoration: BoxDecoration(
        color: AccentColor,
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }

  Widget content1() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/library1');
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 96),
                child: Text(
                  'Burung Ajaib',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.only(left: 46),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ContentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
          new Positioned(
            top: 15,
            child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: AccentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Image.asset(
                  'assets/images/content-2.png',
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }

  // make stateless widget for content with parameter title, image and description

  Widget content2() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/library1');
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 96),
                child: Text(
                  'Kisah Raja Putri\ndan Si Raja Ular',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.only(left: 46),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ContentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
          new Positioned(
            top: 15,
            child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: AccentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Image.asset(
                  'assets/images/content-1.png',
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String? title;
  final String? image;
  final String? description;

  const Content({
    Key? key,
    this.title,
    this.image,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/library1');
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 96),
                child: Text(
                  title!,
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.only(left: 46),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ContentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
          new Positioned(
            top: 15,
            child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: AccentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
