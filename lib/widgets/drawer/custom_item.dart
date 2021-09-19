import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/change_password/change_password.dart';

// ignore: must_be_immutable
class CustomItem extends StatelessWidget {
  String text;
  IconData ic;
  Widget moveTo;
  CustomItem(this.text,this.ic, {this.moveTo});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        ic,
        color: Color(0xff6cbbc7),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Color(
              0xff6cbbc7,
            ),
            fontSize: 15.0),
      ),
      onTap: moveTo == null?null:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => moveTo),
        );
      },
    );
  }
}
