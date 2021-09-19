import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';

import '../widgets/custom_title.dart';
import 'appliance_handle.dart';
import 'fan_speed.dart';

class HandleManually extends StatefulWidget {
  @override
  _HandleManuallyState createState() => _HandleManuallyState();
}

class _HandleManuallyState extends State<HandleManually> {
  bool isAutomatic;
  bool fanStatus = false;
  DatabaseService databaseService;
  _loadMode() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    databaseService = new DatabaseService();
    bool response = await databaseService.getAutomaticMode();
    setState(() {
      //this.isAutomatic = (prefs.getBool('automatic_mode') ?? false);
      this.isAutomatic = response;
    });
  }
  _HandleManuallyState(){
    _loadMode();
  }
  @override
  Widget build(BuildContext context) {

    return isAutomatic==false?Container(
        child: Padding(
      padding: EdgeInsets.all(
        15.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Handle Appliances Manually",
            style: TextStyle(
              color: Color(0xff495355),
              fontSize: 25.0,
              fontFamily: 'Bradley',
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomTitle("Light"),
          ApplianceHandle("light", Icons.lightbulb),
          CustomTitle("Fan"),
          ApplianceHandle("Fan", Icons.ac_unit, callback: (isSwitched){setState((){this.fanStatus = isSwitched;print(fanStatus);});}),
          FanSpeed(fanStatus==null?true:fanStatus),
        ],
      ),
    )): Center(child: Text("Automatic Mode is enabled"),);
  }
}
