import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';

import '../widgets/custom_title.dart';
import 'view_appliance.dart';
import 'view_speed.dart';

class ApplianceStatus extends StatefulWidget {
  @override
  _ApplianceStatusState createState() => _ApplianceStatusState();
}

class _ApplianceStatusState extends State<ApplianceStatus> {
  DatabaseService databaseService = new DatabaseService();

  bool lightStatus = false, fanStatus = false;

  _loadStatus() async {
    this.setState(() async {
      lightStatus = await databaseService.getLightStatus();
      fanStatus = await databaseService.getFanStatus();
      print(lightStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadStatus();
    return Container(
        child: Padding(
      padding: EdgeInsets.all(
        15.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Appliances Status",
            style: TextStyle(
              color: Color(0xff495355),
              fontSize: 25.0,
              fontFamily: 'Bradley',
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomTitle("Light"),
          ViewAppliance("light", Icons.lightbulb, lightStatus),
          CustomTitle("Fan"),
          ViewAppliance("Fan", Icons.ac_unit, fanStatus),
          ViewSpeed(
            status: true,
            speed: 4,
          ),
        ],
      ),
    ));
  }
}
