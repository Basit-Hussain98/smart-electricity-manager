import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';

import '../widgets/drawer/custom_drawer.dart';
import '../widgets/custom_card.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  bool isSwitched = false;
  DatabaseService databaseService;

  _loadMode() async {
    databaseService = new DatabaseService();
    bool response = await databaseService.getAutomaticMode();
    setState(() {
      isSwitched = response;
    });

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   isSwitched = (prefs.getBool('automatic_mode') ?? false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    _loadMode();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6cbbc7),
        elevation: 0.0,
        title: Text("Admin Panel"),
      ),
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(

                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Welcome Admin",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30.0,
                        fontFamily: 'Bradley',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Material(
                        elevation: 12.0,
                        shadowColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          margin: EdgeInsets.only(right: 13.0),
                          height: 80.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Automatic mode",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),

                              Switch(
                                value: isSwitched,
                                onChanged: (value) async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                    //prefs.setBool('automatic_mode', isSwitched);
                                    databaseService.setAutomaticMode(isSwitched);
                                  });
                                },
                                activeTrackColor: Color(0xff81dfee),
                                activeColor: Color(0xff2cb3c7),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        CustomCard("Sensor Status", Icons.wb_sunny_outlined, 0, true),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomCard("Sensor Readings", Icons.account_tree_outlined,1, true),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        CustomCard("Appliances Status", Icons.lightbulb, 2, true),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomCard("Handle Manually", Icons.handyman, 3, true),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
