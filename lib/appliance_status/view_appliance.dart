import 'package:flutter/material.dart';

class ViewAppliance extends StatelessWidget {
  final String _text;
  final IconData _ic;
  final bool status;
  ViewAppliance(this._text, this._ic, this.status);
  @override
  Widget build(BuildContext context) {
    String text = status? "ON": "OFF";
    return Expanded(
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    this._ic,
                    color: Color(0xff6cbbc7),
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    this._text,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6cbbc7)),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: status? Colors.blue: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    border:
                    Border.all(color: status? Color(0xff6cbbc7): Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
