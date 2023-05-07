// component title text

import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class TitleTextComponent extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isCenter;

  TitleTextComponent({
    this.text,
    this.fontSize = 36,
    this.fontWeight = FontWeight.bold,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment:
            isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          Text(
            text!,
            style: blackTextStyle.copyWith(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
