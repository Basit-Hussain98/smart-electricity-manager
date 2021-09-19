import 'package:flutter/material.dart';

class ItemDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Divider(
        height: 1,
        thickness: 2,
        color: Color(0xff6cbbc7),
      ),
    );
  }
}
