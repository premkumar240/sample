import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderDateTimeIntervalPage extends StatefulWidget {
  @override
  _SliderDateTimeIntervalPageState createState() =>
      _SliderDateTimeIntervalPageState();
}

class _SliderDateTimeIntervalPageState
    extends State<SliderDateTimeIntervalPage> {
  DateTime _yearMin = DateTime(2010, 01, 01);
  DateTime _yearMax = DateTime(2020, 01, 01);
  DateTime _yearValues = DateTime(2013, 01, 01);

  DateTime _monthMin = DateTime(2010, 01, 25);
  DateTime _monthMax = DateTime(2010, 12, 01);
  DateTime _monthValues = DateTime(2010, 03, 01);

  DateTime _dayMin = DateTime(2010, 01, 01);
  DateTime _dayMax = DateTime(2010, 01, 30);
  DateTime _dayValues = DateTime(2010, 01, 10);

  DateTime _hourMin = DateTime(2010, 01, 25, 02, 00, 00);
  DateTime _hourMax = DateTime(2010, 01, 25, 22, 00, 00);
  DateTime _hourValues = DateTime(2010, 01, 25, 07, 00, 00);

  DateTime _minuteMin = DateTime(2010, 01, 25, 05, 02, 00);
  DateTime _minuteMax = DateTime(2010, 01, 25, 05, 50, 00);
  DateTime _minuteValues = DateTime(2010, 01, 25, 05, 15, 00);

  DateTime _secMin = DateTime(2010, 01, 25, 05, 10, 05);
  DateTime _secMax = DateTime(2010, 01, 25, 05, 10, 45);
  DateTime _secValues = DateTime(2010, 01, 25, 05, 10, 20);

  double sizeBoxHeight = 20;

  Widget _getAlignedTextWidget(String text,
      {double fontSize = 14, FontWeight fontWeight = FontWeight.normal}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
        padding: const EdgeInsets.only(left: 10),
      ),
    );
  }

  SfSlider get dateYear {
    return SfSlider(
      min: _yearMin,
      max: _yearMax,
      showLabels: true,
      interval: 2,
      showTicks: true,
      enableTooltip: true,
      dateIntervalType: DateIntervalType.years,
      dateFormat: DateFormat.y(),
      value: _yearValues,
      onChanged: (dynamic value) {
        setState(() {
          _yearValues = value;
        });
      },
    );
  }

  SfSlider get dateMonth {
    return SfSlider(
      min: _monthMin,
      max: _monthMax,
      showLabels: true,
      enableTooltip: true,
      interval: 2,
      showTicks: true,
      dateIntervalType: DateIntervalType.months,
      dateFormat: DateFormat.yM(),
      value: _monthValues,
      onChanged: (dynamic value) {
        setState(() {
          _monthValues = value;
        });
      },
    );
  }

  SfSlider get dateDays {
    return SfSlider(
      min: _dayMin,
      max: _dayMax,
      showLabels: true,
      enableTooltip: true,
      interval: 7,
      showTicks: true,
      dateIntervalType: DateIntervalType.days,
      dateFormat: DateFormat.yMd(),
      value: _dayValues,
      onChanged: (dynamic value) {
        setState(() {
          _dayValues = value;
        });
      },
    );
  }

  SfSlider get dateHour {
    return SfSlider(
      min: _hourMin,
      max: _hourMax,
      showLabels: true,
      enableTooltip: true,
      interval: 4,
      showTicks: true,
      dateIntervalType: DateIntervalType.hours,
      dateFormat: DateFormat('h a'),
      value: _hourValues,
      onChanged: (dynamic value) {
        setState(() {
          _hourValues = value;
        });
      },
    );
  }

  SfSlider get dateMinute {
    return SfSlider(
      min: _minuteMin,
      max: _minuteMax,
      showLabels: true,
      enableTooltip: true,
      interval: 7,
      showTicks: true,
      dateIntervalType: DateIntervalType.minutes,
      dateFormat: DateFormat('h:mm'),
      value: _minuteValues,
      onChanged: (dynamic value) {
        setState(() {
          _minuteValues = value;
        });
      },
    );
  }

  SfSlider get dateSec {
    return SfSlider(
      min: _secMin,
      max: _secMax,
      showLabels: true,
      enableTooltip: true,
      interval: 8,
      showTicks: true,
      dateIntervalType: DateIntervalType.seconds,
      dateFormat: DateFormat('mm:ss'),
      value: _secValues,
      onChanged: (dynamic value) {
        setState(() {
          _secValues = value;
        });
      },
    );
  }

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Range slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                sizedBox,
                _getAlignedTextWidget('DateTime interval',
                    fontSize: 22, fontWeight: FontWeight.bold),
                sizedBox,
                _getAlignedTextWidget('Year'),
                dateYear,
                sizedBox,
                _getAlignedTextWidget('Month'),
                dateMonth,
                sizedBox,
                _getAlignedTextWidget('Day'),
                dateDays,
                sizedBox,
                _getAlignedTextWidget('Hour'),
                dateHour,
                sizedBox,
                _getAlignedTextWidget('Minutes'),
                dateMinute,
                sizedBox,
                _getAlignedTextWidget('Second'),
                dateSec,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
