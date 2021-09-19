import 'package:flutter/material.dart';

import '../adminpanel/admin_panel.dart';

import '../add_user/add_user.dart';
class MyButton extends StatelessWidget {
  final String text;
  final Widget goto;

  MyButton({this.text,this.goto});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => goto),
        );
      },
      child: Container(
        width: 100.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Color(0xff6cbbc7),
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
