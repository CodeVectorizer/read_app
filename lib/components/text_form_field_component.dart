import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class TextFormFieldComponent extends StatelessWidget {
  Color? color = ContentColor;
  TextEditingController textEditingController;
  String text;
  String? hintText;
  double? hintFontSize;
  FontWeight? hintFontWeight;
  bool isTextArea;

  TextFormFieldComponent(
      {Key? key,
      this.color,
      required this.textEditingController,
      required this.text,
      this.hintText,
      this.hintFontSize,
      this.isTextArea = false,
      this.hintFontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      padding: EdgeInsets.all(14),
      height: isTextArea ? 250 : 50,
      decoration: BoxDecoration(
        color: color ?? ContentColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: isTextArea ? TextInputType.multiline : TextInputType.text,
        maxLines: isTextArea ? null : 1,
        decoration: InputDecoration.collapsed(
          hintText: hintText ?? text,
          hintStyle: blackTextStyle.copyWith(
            fontSize: hintFontSize,
            fontWeight: hintFontWeight ?? bold,
          ),
        ),
      ),
    );
  }
}
