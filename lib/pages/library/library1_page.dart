import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:read_app/config/CallApi.dart';
import 'package:read_app/models/book_model.dart';
import 'package:read_app/theme.dart';
import 'package:read_app/utils/get_image.dart';

class Library1Page extends StatefulWidget {
  final int? book_id;
  const Library1Page({super.key, required this.book_id});

  @override
  State<Library1Page> createState() => _Library1PageState();
}

class _Library1PageState extends State<Library1Page> {
  var book = BookModel();
  var isLoading = true;
  // method

  // take book_id above
  fetchData(int? book_id) {
    CallApi().getData('books/$book_id').then((response) {
      var jsonData = json.decode(response.body);
      if (jsonData['success']) {
        setState(() {
          book = BookModel.fromJson(jsonData['data']);
          isLoading = false;
        });
        print(jsonData['data']);
      } else {
        print(jsonData['message']);
      }
    });
  }

  @override
  void initState() {
    fetchData(widget.book_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundReadColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 38),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: FutureBuilder(
                    future: getImgUrl(book.cover),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Image.network(
                          snapshot.data.toString(),
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
                        'assets/images/no-image.png',
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ));
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    book.title ?? "",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                    """Upon arrival at the school, the students are sorted into one of four houses—Gryffindor, Hufflepuff, Ravenclaw, or Slytherin. Harry ends up in Gryffindor, and during his eventful first year at Hogwarts he becomes close friends with two other members of the house, Ron Weasley, who comes from an old wizarding family, and Hermione Granger, whose parents are Muggles (those who are not magical). Harry also finds that he has an enemy in Draco Malfoy (Slytherin). In addition, Harry’s prowess in flying on a broomstick makes him a star of Gryffindor’s Quidditch team. Hoping to get Harry and his friends into trouble, Draco tricks them into leaving their rooms one night, a violation of school rules. While trying to avoid being caught, they discover a three-headed dog guarding a trapdoor. Harry gradually comes to the conclusion that Professor Snape, who teaches Potions, dislikes him intensely and is trying to get hold of whatever is behind the trapdoor. Harry receives his father’s cloak of invisibility as a Christmas gift, and, while exploring under the cloak’s cover, he finds the Mirror of Erised, in which he can see his parents. Later, headmaster Albus Dumbledore explains that the mirror shows the viewer’s deepest desire.
Harry, Ron, and Hermione deduce that the treasure under the trapdoor is the Philosopher’s Stone, which can transform metal into gold and can also confer immortality. They later discover that Voldemort has been killing unicorns in the Forbidden Forest and drinking their blood, another way to achieve immortality. The trio comes to believe that Snape is in league with the evil wizard. After learning that Hagrid revealed the secret way to lull the three-headed dog to sleep to a suspicious stranger, whom they believe to be either Snape or Voldemort, they are certain that the Philosopher’s Stone is in danger. The three classmates use the cloak of invisibility on a secret mission to get the Stone themselves to keep it from Voldemort. After getting past the dog and defeating various protective spells, Harry reaches the room in which the Stone is hidden and is surprised to find the perpetually nervous Professor Quirrell there. Quirrell fails to figure out how to retrieve the Stone from the Mirror of Erised (the final protective measure) and forces Harry to try. When standing in front of the mirror, wishing only to protect the Stone and not use it for himself, Harry feels the Stone’s weight in his pocket but refuses to tell Quirrell that he has it. Quirrell unwraps his turban, revealing Voldemort’s face on the back of his head. Voldemort explains that he has been sharing Quirrell’s body until he can get to the Stone and become fully alive again, and Voldemort/Quirrell and Harry fight for possession of the Stone, until Harry blacks out. He awakens in the infirmary and learns that Dumbledore saved him, the Stone is to be destroyed, and Voldemort escaped.
                     """),
                finishButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget finishButton() {
    return Container(
      margin: EdgeInsets.only(top: 34),
      height: 43,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        style: TextButton.styleFrom(
          backgroundColor: AccentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Text(
          'Finish',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            color: MainColor,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
