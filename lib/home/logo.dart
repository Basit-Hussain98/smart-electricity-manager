import 'package:flutter/material.dart';

class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Image.asset(
        "images/logo.png",
        width: 100.0,
        height: 130.0,
      ),
    );
  }

}