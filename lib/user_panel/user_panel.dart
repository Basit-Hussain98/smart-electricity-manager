import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_drawer.dart';
import '../widgets/custom_card.dart';

class UserPanel extends StatefulWidget {
  @override
  _UserPanelState createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  bool isSwitched = false;

  _loadMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitched = (prefs.getBool('automatic_mode') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadMode();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6cbbc7),
        elevation: 0.0,
        title: Text("User Panel"),
      ),
      drawer: UserDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Welcome User",
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
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        CustomCard("Sensor Status", Icons.wb_sunny_outlined, 0, false),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomCard("Sensor Readings", Icons.account_tree_outlined,1, false),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        CustomCard("Appliances Status", Icons.lightbulb, 2, false),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomCard("Handle Manually", Icons.handyman, 3, false),

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
