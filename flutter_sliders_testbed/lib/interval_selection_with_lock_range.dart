import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSelectorLockRangeWithInterval extends StatefulWidget {
  @override
  _RangeSelectorLockRangeWithIntervalState createState() =>
      _RangeSelectorLockRangeWithIntervalState();
}

class _RangeSelectorLockRangeWithIntervalState
    extends State<RangeSelectorLockRangeWithInterval> {
  final double _min = 2.0;
  final double _max = 20.0;
  SfRangeValues _values = SfRangeValues(8.0, 14.0);
  RangeController _rangeController;

  double sizeBoxHeight = 20;

  @override
  void initState() {
    super.initState();
    _rangeController = RangeController(start: _values.start, end: _values.end);
  }

  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

  final List<Data> chartData = <Data>[
    Data(x: 2.0, y: 2.2),
    Data(x: 3.0, y: 3.4),
    Data(x: 4.0, y: 2.8),
    Data(x: 5.0, y: 1.6),
    Data(x: 6.0, y: 2.3),
    Data(x: 7.0, y: 2.5),
    Data(x: 8.0, y: 2.9),
    Data(x: 9.0, y: 3.8),
    Data(x: 10.0, y: 3.7),
    Data(x: 11.0, y: 2.2),
    Data(x: 12.0, y: 3.4),
    Data(x: 13.0, y: 2.8),
    Data(x: 14.0, y: 1.6),
    Data(x: 15.0, y: 2.3),
    Data(x: 16.0, y: 2.5),
    Data(x: 17.0, y: 2.9),
    Data(x: 18.0, y: 3.8),
    Data(x: 19.0, y: 3.7),
    Data(x: 20.0, y: 3.5),
  ];

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Range selector demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SfRangeSelector(
                      min: _min,
                      max: _max,
                      interval: 3,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      enableIntervalSelection: true,
                      dragMode: SliderDragMode.both,
                      initialValues: _values,
                      child: Container(
                        height: 130,
                        child: SfCartesianChart(
                          margin: const EdgeInsets.all(0),
                          primaryXAxis: NumericAxis(
                              minimum: _min, maximum: _max, isVisible: false),
                          primaryYAxis: NumericAxis(isVisible: false),
                          plotAreaBorderWidth: 0,
                          series: <SplineAreaSeries<Data, double>>[
                            SplineAreaSeries<Data, double>(
                                color: Color.fromARGB(255, 126, 184, 253),
                                dataSource: chartData,
                                xValueMapper: (Data sales, _) => sales.x,
                                yValueMapper: (Data sales, _) => sales.y)
                          ],
                        ),
                      ),
                    ),
                    sizedBox,
                    sizedBox,
                    sizedBox,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Data {
  Data({this.x, this.y});
  final double x;
  final double y;
}
