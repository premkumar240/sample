import 'dart:core';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  DateTimeAxis get primaryXAxis =>
      DateTimeAxis(interval: 1, intervalType: DateTimeIntervalType.months);

  NumericAxis get primaryYAxis => NumericAxis();

  List<Data> get dataSource => [
        Data(DateTime.utc(2000, 01, 30, 00, 00), 15),
        Data(DateTime.utc(2000, 03, 10, 00, 00), 38),
        Data(DateTime.utc(2000, 05, 15, 00, 00), 18),
        Data(DateTime.utc(2000, 07, 20, 00, 00), 60),
        Data(DateTime.utc(2000, 09, 25, 00, 00), 40),
      ];

  SfCartesianChart get columnChart => SfCartesianChart(
        primaryXAxis: primaryXAxis,
        primaryYAxis: primaryYAxis,
        plotAreaBorderColor: Theme.of(context).primaryColor.withOpacity(0.24),
        margin: EdgeInsets.all(0),
        series: <ChartSeries>[
          LineSeries<Data, DateTime>(
              animationDuration: 0,
              dataSource: dataSource,
              xValueMapper: (Data data, _) => data.date,
              yValueMapper: (Data data, _) => data.unit)
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[columnChart],
      ),
    );
  }
}

class Data {
  Data(this.date, this.unit);
  final DateTime date;
  final double unit;
}
