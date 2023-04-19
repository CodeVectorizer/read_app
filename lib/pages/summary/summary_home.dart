import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/summary_model.dart';
import 'package:read_app/theme.dart';

class SummaryHomePage extends StatefulWidget {
  const SummaryHomePage({super.key});

  @override
  State<SummaryHomePage> createState() => _SummaryHomePageState();
}

class _SummaryHomePageState extends State<SummaryHomePage> {
  // list variable
  var summaries = <SummaryModel>[];
  var isLoading = true;
  // method
  fetchData() {
    CallApi().getData('summaries').then((response) {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        Iterable list = jsonData['data'];
        print(list);
        setState(() {
          isLoading = false;
          summaries =
              list.map((model) => SummaryModel.fromJson(model)).toList();
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
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 24), children: [
          title(),
          block(),
          this.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: summaries.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Content(
                      title: 'test',
                      description: 'test',
                    );
                  }),
        ]),
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

  Widget block() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
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
                  'test',
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
