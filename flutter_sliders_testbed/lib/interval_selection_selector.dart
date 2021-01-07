import 'dart:ui';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSelectorLabelClickPage extends StatefulWidget {
  @override
  _RangeSelectorLabelClickPageState createState() =>
      _RangeSelectorLabelClickPageState();
}

class _RangeSelectorLabelClickPageState
    extends State<RangeSelectorLabelClickPage> {
  SfRangeValues _monthDateValues =
      SfRangeValues(DateTime(2010, 05, 01), DateTime(2010, 07, 01));
  double sizeBoxHeight = 20;

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

  DateTime _min = DateTime(2010, 01, 01);
  DateTime _max = DateTime(2010, 12, 01);
  RangeController _rangeController;
  SfCartesianChart splineChart;

  @override
  void initState() {
    super.initState();
    _rangeController = RangeController(
        start: _monthDateValues.start, end: _monthDateValues.end);
  }

  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

  final List<Data> chartData = <Data>[
    Data(x: DateTime(2010, 01, 01), y: 2.2),
    Data(x: DateTime(2010, 01, 14), y: 3.4),
    Data(x: DateTime(2010, 01, 28), y: 2.8),
    Data(x: DateTime(2010, 02, 05), y: 1.6),
    Data(x: DateTime(2010, 02, 16), y: 2.3),
    Data(x: DateTime(2010, 02, 25), y: 2.5),
    Data(x: DateTime(2010, 03, 02), y: 2.9),
    Data(x: DateTime(2010, 03, 12), y: 3.8),
    Data(x: DateTime(2010, 03, 21), y: 3.7),
    Data(x: DateTime(2010, 03, 27), y: 2.2),
    Data(x: DateTime(2010, 04, 03), y: 3.4),
    Data(x: DateTime(2010, 04, 11), y: 2.8),
    Data(x: DateTime(2010, 04, 18), y: 1.6),
    Data(x: DateTime(2010, 04, 25), y: 2.3),
    Data(x: DateTime(2010, 05, 06), y: 2.5),
    Data(x: DateTime(2010, 05, 14), y: 2.9),
    Data(x: DateTime(2010, 05, 24), y: 3.8),
    Data(x: DateTime(2010, 05, 30), y: 3.7),
    Data(x: DateTime(2010, 06, 01), y: 2.2),
    Data(x: DateTime(2010, 06, 14), y: 3.4),
    Data(x: DateTime(2010, 06, 28), y: 2.8),
    Data(x: DateTime(2010, 07, 05), y: 1.6),
    Data(x: DateTime(2010, 07, 16), y: 2.3),
    Data(x: DateTime(2010, 07, 25), y: 2.5),
    Data(x: DateTime(2010, 08, 02), y: 2.9),
    Data(x: DateTime(2010, 08, 12), y: 3.8),
    Data(x: DateTime(2010, 08, 21), y: 3.7),
    Data(x: DateTime(2010, 08, 27), y: 2.2),
    Data(x: DateTime(2010, 09, 03), y: 3.4),
    Data(x: DateTime(2010, 09, 11), y: 2.8),
    Data(x: DateTime(2010, 09, 18), y: 1.6),
    Data(x: DateTime(2010, 09, 25), y: 2.3),
    Data(x: DateTime(2010, 10, 06), y: 2.5),
    Data(x: DateTime(2010, 10, 14), y: 2.9),
    Data(x: DateTime(2010, 10, 24), y: 3.8),
    Data(x: DateTime(2010, 10, 30), y: 3.7),
    Data(x: DateTime(2010, 11, 01), y: 2.2),
    Data(x: DateTime(2010, 11, 14), y: 3.4),
    Data(x: DateTime(2010, 11, 28), y: 2.8),
    Data(x: DateTime(2010, 12, 01), y: 1.6),
  ];

  @override
  Widget build(BuildContext context) {
    splineChart = SfCartesianChart(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      primaryXAxis: DateTimeAxis(
          minimum: _min,
          maximum: _max,
          isVisible: true,
          rangeController: _rangeController),
      primaryYAxis: NumericAxis(isVisible: true),
      plotAreaBorderWidth: 0,
      series: <SplineSeries<Data, DateTime>>[
        SplineSeries<Data, DateTime>(
            color: Color.fromARGB(255, 126, 184, 253),
            dataSource: chartData,
            animationDuration: 0,
            xValueMapper: (Data sales, _) => sales.x,
            yValueMapper: (Data sales, _) => sales.y)
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Range selector demo'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 80),
            child: Column(
              children: <Widget>[
                Container(
                  child: splineChart,
                ),
                SfRangeSelector(
                  min: _min,
                  max: _max,
                  interval: 2,
                  showTicks: true,
                  showLabels: true,
                  enableIntervalSelection: true,
                  dateFormat: DateFormat.yM(),
                  dateIntervalType: DateIntervalType.months,
                  controller: _rangeController,
                  child: Container(
                    height: 130,
                    child: SfCartesianChart(
                      margin: const EdgeInsets.all(0),
                      primaryXAxis: DateTimeAxis(
                          minimum: _min, maximum: _max, isVisible: false),
                      primaryYAxis: NumericAxis(isVisible: false),
                      plotAreaBorderWidth: 0,
                      series: <SplineSeries<Data, DateTime>>[
                        SplineSeries<Data, DateTime>(
                            color: Color.fromARGB(255, 126, 184, 253),
                            dataSource: chartData,
                            xValueMapper: (Data sales, _) => sales.x,
                            yValueMapper: (Data sales, _) => sales.y)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Data {
  Data({this.x, this.y});
  final DateTime x;
  final double y;
}
