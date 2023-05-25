import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:read_app/models/categories_model.dart';
import 'package:read_app/pages/my_summary/add_summary_page.dart';
import 'package:read_app/pages/my_writing/add_writing_page.dart';
import 'package:read_app/theme.dart';

class ChooseWritingCategoryPage extends StatefulWidget {
  const ChooseWritingCategoryPage({Key? key}) : super(key: key);

  @override
  State<ChooseWritingCategoryPage> createState() =>
      _ChooseWritingCategoryPageState();
}

class _ChooseWritingCategoryPageState extends State<ChooseWritingCategoryPage> {
  var isLoading = true;
  var categories = <CategoryModel>[];

  var categoriesData = [
    {
      'id': 1,
      'name': 'Cerpen',
      'image': 'assets/images/cerpen.png',
    },
    {
      'id': 2,
      'name': 'Artikel',
      'image': 'assets/images/artikel.png',
    },
    {
      'id': 3,
      'name': 'Puisi',
      'image': 'assets/images/puisi.png',
    }
  ];

  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
      categories = categoriesData
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    });
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
            this.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Content(
                        title: categories[index].name[0].toUpperCase() +
                            categories[index].name.substring(1),
                        image: categories[index].image,
                        // description: categories[index].description,
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
            'Choose Category Writing',
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddWritingPage(category: title ?? '')));
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
                  color: BlockColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
