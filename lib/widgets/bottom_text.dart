
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String msg, link;
  final Widget moveTo;

  const BottomText({Key key, this.msg, this.link, this.moveTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: msg + " ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff696969),
          ),
          children: <TextSpan>[
            TextSpan(
              text: link,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff6cbbc7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
