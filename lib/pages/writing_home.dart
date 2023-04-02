import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/writing_model.dart';
import 'package:read_app/theme.dart';

class WritingHomePage extends StatefulWidget {
  const WritingHomePage({super.key});

  @override
  State<WritingHomePage> createState() => _WritingHomePageState();
}

class _WritingHomePageState extends State<WritingHomePage> {
  var writings = <WritingModel>[];
  var isLoading = true;
  // method
  fetchData() {
    CallApi().getData('writings').then((response) {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        Iterable list = jsonData['data'];
        print(list);
        setState(() {
          writings = list.map((model) => WritingModel.fromJson(model)).toList();
          isLoading = false;
        });
      } else {
        print('test');
        print(jsonData['message']);
      }
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
                    itemCount: writings.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Content(
                        title: writings[index].title,
                        image: writings[index].cover,
                        description: writings[index].description,
                      );
                    }),
            content1(),
            content2(),
            content3(),
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
            'Writing',
            style: blackTextStyle.copyWith(
              fontSize: 30,
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
        color: ContentColor,
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
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Artikel',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 45),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ContentColor,
                borderRadius: BorderRadius.circular(9),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget content2() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Cerpen',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 45),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ContentColor,
                borderRadius: BorderRadius.circular(9),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget content3() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Puisi',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 45),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ContentColor,
                borderRadius: BorderRadius.circular(9),
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
            ),
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
