import 'package:flutter/material.dart';

import 'colors_selection.dart';

// ignore: must_be_immutable
class SensorCard extends StatelessWidget {
  String text;
  IconData ic;
  ColorSelection color;
  Function selectColor;
  int n;
  SensorCard(this.text,this.ic, this.color, this.selectColor, this.n);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: color.textColor == Colors.white ? 0.0:10.0,
        shadowColor: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {
            this.selectColor(this.n);
          },
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: color.backgroundColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  ic,
                  color: color.iconColor,
                  size: 40.0,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 15.0, color: color.textColor),
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
