import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FanSpeed extends StatefulWidget {
  final bool _flag;
  FanSpeed(this._flag);
  @override
  _FanSpeedState createState() => _FanSpeedState();
}

class _FanSpeedState extends State<FanSpeed> {
  //bool _flag;
  double _volumeValue = 0.0;


  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }
  // _FanSpeedState(bool flag){
  //   setState(() {
  //     this._flag = flag;
  //   });
  // }

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
                    value: _volumeValue,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 9,
                    color:widget._flag? Color(0xff81dfee): Colors.black12,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                  ),
                  MarkerPointer(
                      value: _volumeValue,
                      enableDragging: widget._flag,
                      onValueChanged: widget._flag? onVolumeChanged: null,
                      markerHeight: 15,
                      markerWidth: 15,
                      markerType: MarkerType.circle,
                      color: widget._flag? Color(0xff2cb3c7): Colors.black26,
                      borderWidth: 2,
                      borderColor: Colors.white54)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.2,
                    widget: Text(
                      (_volumeValue / 10).ceil().toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: widget._flag? Color(0xff81dfee): Colors.white54,
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
              color: widget._flag?Color(0xff6cbbc7): Colors.white54,
            ),
          ),
        ),
      ],
    );
  }
}
