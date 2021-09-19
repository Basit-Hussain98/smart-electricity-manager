import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ViewSpeed extends StatelessWidget {
  final double speed;
  final bool status;
  ViewSpeed({this.status, this.speed});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 200,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.7,
                axisLineStyle: AxisLineStyle(
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.black12,
                    thickness: 9),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: status? speed:0.0,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 9,
                    color:status? Color(0xff81dfee): Colors.black12,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                  ),
                  MarkerPointer(
                      value: status? speed:0.0,
                      enableDragging: false,
                      onValueChanged: null,
                      markerHeight: 15,
                      markerWidth: 15,
                      markerType: MarkerType.circle,
                      color: status? Color(0xff2cb3c7): Colors.black26,
                      borderWidth: 2,
                      borderColor: Colors.white54)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.2,
                    widget: Text(
                      status? speed.toString(): "",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: status? Color(0xff81dfee): Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 160,
          left: 60,
          child: Text(
            "Fan Speed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              color: status?Color(0xff6cbbc7): Colors.white54,
            ),
          ),
        ),
      ],
    );
  }
}
