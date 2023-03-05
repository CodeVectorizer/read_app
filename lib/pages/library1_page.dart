import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:read_app/theme.dart';

class Library1Page extends StatefulWidget {
  const Library1Page({super.key});

  @override
  State<Library1Page> createState() => _Library1PageState();
}

class _Library1PageState extends State<Library1Page> {
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
                Text("""
          Suatu pagi, cuaca di Kerajaan Rimba Belantara terlihat cerah.
          Penghuninya adalah binatang dari berbagai jenis yang
          berperilakuseperti manusia. Setiap jenis binatang memiliki raja
          masing-masing.Pemegang kedudukan tertinggi adalah
          Pemimpin Agung yang dijabatoleh Raja Pelanduk.
          
          Sesuai dengan namanya, kerajaan itu terletak di kawasan
          hutanbelantara yang dikelilingi lautan luas. Pohon-pohon besar
          berdirikokoh di pinggir-pinggir negeri yang menjadi gerbang
          masuk kekawasan Kerajaan Rimba Belantara. Makin ke dalam
          makin pekat dangelap oleh rimbunan dedaunan. Negeri itu
          berbukit-bukit dan jarangdidatangi manusia. Di belakang bukit
          sebelah barat rombongan rusayang dipimpin rajanya tengah
          merumput. Di atas pohon-pohon besarsekawanan monyet
          bergelantungan tengah makan buah-buahan.Begitu pula burung
          burung ikut merubung pohon senduru yang tengahberbuah.
          Sementara di bawah pohon, pasukan singa tengah bermalas-
          malasan.Setelah memegang tampuk kekuasaan, Raja Pelanduk
          berhasilmenyelesaikan konflik antarbangsa binatang di Kerajaan
          RimbaBelantara yang sangat luas itu, misalnya konflik antara
          bangsa Semutdan Gajah, konflik Serigala dengan Kambing,
          serta konflik Kera dengan Singa. Semua persoalan dalam
          kerajaan itu, satu per satu, bisadiselesaikannya dengan baik.
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
