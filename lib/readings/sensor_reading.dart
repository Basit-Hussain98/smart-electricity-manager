import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';
import '../widgets/sensor_card.dart';
import '../widgets/colors_selection.dart';
import 'display_light_reading.dart';
import 'display_reading.dart';

class SensorReading extends StatefulWidget {
  @override
  _SensorReadingState createState() => _SensorReadingState();
}

class _SensorReadingState extends State<SensorReading> {
  int selection = 1;
  num temperature;
  String light;
  DatabaseService databaseService = new DatabaseService();
  _loadSensorsData() async {
    temperature = await databaseService.getTemperature();
    light = await databaseService.getLight();
  }

  ColorSelection c1 =
      ColorSelection(Colors.white, Color(0xff6cbbc7), Colors.black);
  ColorSelection c2 =
      ColorSelection(Color(0xff6cbbc7), Colors.white, Colors.white);

  void select(int s) {
    setState(() {
      this.selection = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadSensorsData();
    Widget w;
    switch (this.selection) {
      case 1:
        setState(() {
          // w = DisplayReading(90, "Light Intensity");
          w = DisplayLightReading(light != null ? light : "");
        });
        break;
      case 2:
        setState(() {
          w = DisplayReading(temperature, "Temperature");
        });
        break;
      // case 3:
      //   setState(() {
      //     w = DisplayReading(0, "Kinect");
      //   });
      //   break;
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
                // SensorCard("Kinect Sensor", Icons.accessibility_new_outlined,
                //     this.selection == 3 ? c2 : c1, this.select, 3),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            w,
          ],
        ),
      ),
    );
  }
}
