import 'package:flutter/material.dart';

import '../panel/view_panel.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String text;
  IconData ic;
  int togo;
  bool isAdmin;
  CustomCard(this.text,this.ic, this.togo, this.isAdmin);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewPanel(togo, isAdmin)),
            );
          },
          child: Container(
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  ic,
                  color: Color(0xff2cb3c7),
                  size: 40.0,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
