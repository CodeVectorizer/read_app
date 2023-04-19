import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';

class BlockComponent extends StatelessWidget {
  const BlockComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
