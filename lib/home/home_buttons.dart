import 'package:flutter/material.dart';


// ignore: must_be_immutable
class HomeButtons extends StatelessWidget {
  String _text;
  IconData _ic;
  Widget _moveTo;

  HomeButtons(String text, IconData ic, Widget moveTo) {
    this._text = text;
    this._ic = ic;
    this._moveTo = moveTo;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _moveTo),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 60.0,
          width: 200.0,
          margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
          decoration: BoxDecoration(
              color: Color(0xff6cbbc7),
              borderRadius: BorderRadius.circular(30.0)),
          child: ListTile(
            leading: Icon(
              _ic,
              color: Colors.white,
            ),
            title: Text(
              _text,
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
