import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Smart Electricity Manager",
        style: TextStyle(
          color: Color(0xff495355),
          fontSize: 25.0,
          fontFamily: 'Bradley',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
