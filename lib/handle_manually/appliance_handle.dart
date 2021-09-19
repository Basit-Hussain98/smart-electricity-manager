import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';


// ignore: camel_case_types
typedef callback<int>(int isSwitched);
class ApplianceHandle extends StatefulWidget {
  final String _text;
  final IconData _ic;
  final ValueSetter<bool> callback;
  ApplianceHandle(this._text, this._ic,{this.callback}){
    //this.callback(false);
  }
  @override
  _ApplianceHandleState createState() => _ApplianceHandleState(this._text, this._ic);
}


class _ApplianceHandleState extends State<ApplianceHandle> {
  bool isSwitched = false;
  String _text;
  IconData _ic;
  DatabaseService databaseService;
  _ApplianceHandleState(this._text, this._ic){
    databaseService = new DatabaseService();

    //widget.callback(false);
  }
  _loadStatus() async{
    bool response = false;
    if (this._text == "Fan") {
      response = await databaseService.getFanStatus();
      setState(() {
        isSwitched = response;
      });
    }
    else {
      response = await databaseService.getLightStatus();
      setState(() {
        isSwitched = response;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    _loadStatus();
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
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if (widget._text == "Fan") {
                      databaseService.setFanStatus(isSwitched);
                    }
                    else {
                      databaseService.setLightStatus(isSwitched);
                    }
                    print(isSwitched);
                    if(widget._text == "Fan")
                      widget.callback(this.isSwitched);
                  });
                },
                activeTrackColor: Color(0xff81dfee),
                activeColor: Color(0xff2cb3c7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
