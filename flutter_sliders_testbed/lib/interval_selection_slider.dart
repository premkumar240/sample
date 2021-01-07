import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderLabelClickPage extends StatefulWidget {
  @override
  _RangeSliderLabelClickPageState createState() =>
      _RangeSliderLabelClickPageState();
}

class _RangeSliderLabelClickPageState extends State<RangeSliderLabelClickPage> {
  SfRangeValues _numIntervalValues = SfRangeValues(40.0, 60.0);
  SfRangeValues _yearDateValues =
      SfRangeValues(DateTime(2012, 01, 01), DateTime(2013, 01, 01));
  double sizeBoxHeight = 60;

  Widget _getAlignedTextWidget(String text,
      {double fontSize = 14, FontWeight fontWeight = FontWeight.normal}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
        padding: EdgeInsets.only(left: 10),
      ),
    );
  }

  SfRangeSlider get numericSelectedInt => SfRangeSlider(
        min: 0.0,
        max: 100.0,
        values: _numIntervalValues,
        interval: 20,
        showLabels: true,
        enableIntervalSelection: true,
        showTicks: true,
        onChanged: (value) {
          setState(() {
            _numIntervalValues = value;
          });
        },
      );

  SfRangeSlider get yearDateSelectedInt => SfRangeSlider(
        min: DateTime(2010, 01, 01),
        max: DateTime(2015, 01, 01),
        values: _yearDateValues,
        interval: 1,
        showLabels: true,
        enableTooltip: true,
        showTicks: true,
        enableIntervalSelection: true,
        dateIntervalType: DateIntervalType.years,
        dateFormat: DateFormat.y(),
        onChanged: (value) {
          setState(() {
            _yearDateValues = value;
          });
        },
      );

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Range slider demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getAlignedTextWidget('Numeric Interval selection'),
              numericSelectedInt,
              sizedBox,
              _getAlignedTextWidget('Date Interval selection'),
              yearDateSelectedInt,
              sizedBox,
            ],
          ),
        ));
  }
}
