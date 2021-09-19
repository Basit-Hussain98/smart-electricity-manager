import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';

import '../widgets/colors_selection.dart';
import '../widgets/sensor_card.dart';
import 'display_status.dart';

/*class SensorStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        Column(
          children: [
            Row(
              children: [
                SizedBox(height: 10.0,),
                Expanded(
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.lightbulb, color: Color(0xff6cbbc7), size: 30.0,),
                        Text(
                          "Light Sensor",
                          style: TextStyle(fontSize: 15.0, color: Color(0xff6cbbc7), fontWeight: FontWeight.w900,),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Connected",
                          style: TextStyle(fontSize: 10.0, color: Colors.blue, fontWeight: FontWeight.w900,),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "45",
                          style: TextStyle(fontSize: 50.0, color: Colors.black87,),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Working Well",
                            style: TextStyle(fontSize: 10.0, color: Colors.blue,),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff6cbbc7), width: 3.0),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        SizedBox(height: 10.0,),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5.0,),
                Expanded(
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.blueGrey,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.lightbulb, color: Color(0xff6cbbc7), size: 30.0,),
                        Text(
                          "Light Sensor",
                          style: TextStyle(fontSize: 15.0, color: Color(0xff6cbbc7), fontWeight: FontWeight.w900,),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Connected",
                          style: TextStyle(fontSize: 10.0, color: Colors.blue, fontWeight: FontWeight.w900,),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "45",
                          style: TextStyle(fontSize: 50.0, color: Colors.black87,),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Working Well",
                            style: TextStyle(fontSize: 10.0, color: Colors.blue,),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff6cbbc7), width: 3.0),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10.0,),
          ],
        ),
      ],
    );
  }
}

 */

class SensorStatus extends StatefulWidget {
  @override
  _SensorStatusState createState() => _SensorStatusState();
}

class _SensorStatusState extends State<SensorStatus> {
  int selection = 1;
  num temperature;
  String light;
  bool faulty;
  DatabaseService databaseService = new DatabaseService();
  ColorSelection c1 =
      ColorSelection(Colors.white, Color(0xff6cbbc7), Colors.black);
  ColorSelection c2 =
      ColorSelection(Color(0xff6cbbc7), Colors.white, Colors.white);

  void select(int s) {
    setState(() {
      this.selection = s;
    });
  }

  _loadSensorsData() async {
    this.setState(() async {
      temperature = await databaseService.getTemperature();
      light = await databaseService.getLight();
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadSensorsData();
    Widget w;
    switch (this.selection) {
      case 1:
        setState(() {
          w = DisplayStatus(
            sensor: "Light Sensor",
            reading: light != null ? light : "",
            isConnected: true,
            isFaulty: false,
          );
        });
        break;
      case 2:
        faulty = temperature < -2 || temperature > 60;
        setState(() {
          w = DisplayStatus(
            sensor: "Temperature",
            reading: temperature.toString(),
            isConnected: temperature != null ? true : false,
            isFaulty: faulty,
          );
        });
        break;
      // case 3:
      //   setState(() {
      //     w = DisplayStatus(sensor: "Kinect Sensor", reading: "--",isConnected: true,);
      //   });
      // break;
    }
    return Container(
      child: Padding(
        padding: EdgeInsets.all(
          15.0,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SensorCard("Light Sensor", Icons.lightbulb,
                    this.selection == 1 ? c2 : c1, this.select, 1),
                SizedBox(
                  width: 10.0,
                ),
                SensorCard("Temperature Sensor", Icons.wb_sunny,
                    this.selection == 2 ? c2 : c1, this.select, 2),
                SizedBox(
                  width: 10.0,
                ),
                // SensorCard(
                //     "Kinect Sensor",
                //     Icons.accessibility_new_outlined,
                //     this.selection == 3 ? c2 : c1,
                //     this.select,
                //     3),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            //DisplayStatus(sensor: "Light Sensor", isConnected: false,)
            w,
          ],
        ),
      ),
    );
  }
}
