import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/user_panel/user_drawer.dart';

import '../widgets/drawer/custom_drawer.dart';
import '../readings/sensor_reading.dart';
import '../handle_manually/handle_manually.dart';
import '../sensor_status/sensor_status.dart';
import '../appliance_status/appliance_status.dart';

class ViewPanel extends StatefulWidget {
  final int togo;
  final bool isAdmin;
  ViewPanel(this.togo, this.isAdmin);
  @override
  _ViewPanelState createState() => _ViewPanelState();
}

class _ViewPanelState extends State<ViewPanel> {
  int currentIndex = -1;

  void navIndex(int i) {
    setState(() {
      this.currentIndex = i;
      print(this.currentIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    if(this.currentIndex == -1){
      this.currentIndex = widget.togo;
    }
    Widget wid;
    switch(this.currentIndex){
      case 0:
        setState(() {
          wid = SensorStatus();
        });
        break;
      case 1:
        setState(() {
          wid = SensorReading();
        });
        break;
      case 2:
        setState(() {
          wid = ApplianceStatus();
        });
        break;
      case 3:
        setState(() {
          wid = HandleManually();
        });
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6cbbc7),
        elevation: 0.0,
        title: Text("Smart Electricity Manager"),
      ),
      drawer: widget.isAdmin? CustomDrawer(): UserDrawer(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color(0xff6cbbc7),
            primaryColor: Colors.white,

            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white70))
        ),
        child: BottomNavigationBar(

          //backgroundColor: Color(0xff6cbbc7),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wb_sunny_outlined,
                color: Colors.white70,
              ),
              label: "Sensor Status",
              activeIcon: Icon(
                Icons.wb_sunny,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_tree_outlined,
                color: Colors.white70,
              ),
              label: "Sensor Reading",
              activeIcon: Icon(
                Icons.account_tree,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.lightbulb_outline,
                color: Colors.white70,
              ),
              label: "Appliances Status",
              activeIcon: Icon(
                Icons.lightbulb,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.handyman_outlined,
                color: Colors.white70,
              ),
              label: "Handle Manually",
              activeIcon: Icon(
                Icons.handyman,
                color: Colors.white,
              ),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: this.currentIndex,
          iconSize: 22.0,
          selectedLabelStyle: TextStyle(fontSize: 9.0, color: Colors.white),
          unselectedLabelStyle: TextStyle(fontSize: 9.0, color: Colors.white54),
          onTap: (value) => this.navIndex(value),
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
      body: wid,
    );
  }
}
