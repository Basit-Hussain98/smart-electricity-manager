import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String _text;
  CustomTitle(this._text);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(children: <Widget>[
        Container(
          width: 20,
          child: Divider(
            color: Color(0xff6cbbc7),
            thickness: 1.0,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          _text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xff6cbbc7),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Divider(
            color: Color(0xff6cbbc7),
            thickness: 1.0,
          ),
        ),
      ]),
    );
  }
}
