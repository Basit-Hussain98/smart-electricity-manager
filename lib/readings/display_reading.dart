import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// ignore: must_be_immutable
class DisplayReading extends StatelessWidget {
  double val;
  String text;
  DisplayReading(this.val, this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 250.0,
              width: 250.0,
              child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 150, color: Color(0xff6cbbc7), startWidth: 15.0, endWidth: 15.0),
              ], pointers: <GaugePointer>[
                NeedlePointer(value: val, needleColor: Color(0xff6cbbc7),)
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                      child: Text(
                        val.toString(),
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff6cbbc7),),
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5),
              ]),
            ],
          )),
        ),
        Text(text,
          style: TextStyle(
            color: Color(0xff086572),
            fontSize: 25.0,
            fontFamily: 'Bradley',
            fontWeight: FontWeight.bold,
          ),),
      ],
    );
  }
}
