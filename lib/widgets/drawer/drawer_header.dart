import 'package:flutter/material.dart';

class DrawerHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff6cbbc7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "images/logo.png",
                  width: 60.0,
                  height: 60.0,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Basit Hussain',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Bradley',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  'bassithussain98@gmail.com',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
