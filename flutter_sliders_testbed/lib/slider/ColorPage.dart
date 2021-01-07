import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderColorPage extends StatefulWidget {
  @override
  _SliderColorPageState createState() => _SliderColorPageState();
}

class _SliderColorPageState extends State<SliderColorPage> {
  double _min = 20;
  double _max = 90;
  DateTime _dateMin = DateTime(2010, 01, 01);
  DateTime _dateMax = DateTime(2010, 12, 01);
  DateTime _dateValues = DateTime(2010, 03, 01);
  double _numValues = 40.0;
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

  SfSliderTheme get numericDefaultMin {
    return SfSliderTheme(
      data: SfRangeSliderThemeData(
        activeTrackColor: Colors.red,
        inactiveTrackColor: Colors.green,
        thumbColor: Colors.red,
        thumbStrokeWidth: 3,
        activeDivisorRadius: 5,
        inactiveDivisorRadius: 5,
        thumbStrokeColor: Colors.blue,
        activeDivisorStrokeWidth: 2,
        inactiveDivisorStrokeWidth: 2,
        activeDivisorStrokeColor: Colors.blue,
        inactiveDivisorStrokeColor: Colors.red,
        overlayColor: Colors.red.withAlpha(200),
        activeTickColor: Colors.red,
        inactiveTickColor: Colors.green,
        activeMinorTickColor: Colors.red,
        inactiveMinorTickColor: Colors.green,
        activeDivisorColor: Colors.blue,
        inactiveDivisorColor: Colors.red,
        activeLabelStyle: TextStyle(color: Colors.red, fontSize: 12),
        inactiveLabelStyle: TextStyle(color: Colors.green, fontSize: 12),
        tooltipBackgroundColor: Colors.green,
      ),
      child: SfSlider(
        min: _min,
        max: _max,
        value: _numValues,
        showLabels: true,
        showDivisors: true,
        showTicks: true,
        interval: 10,
        onChanged: (dynamic value) {
          setState(() {
            _numValues = value;
          });
        },
      ),
    );
  }

  SfSliderTheme get dateDefault {
    return SfSliderTheme(
      data: SfRangeSliderThemeData(
          activeTrackColor: Colors.red,
          inactiveTrackColor: Colors.green,
          thumbColor: Colors.red,
          thumbStrokeWidth: 3,
          activeDivisorRadius: 5,
          inactiveDivisorRadius: 5,
          thumbStrokeColor: Colors.blue,
          activeDivisorStrokeWidth: 2,
          inactiveDivisorStrokeWidth: 2,
          activeDivisorStrokeColor: Colors.blue,
          inactiveDivisorStrokeColor: Colors.red,
          activeTickColor: Colors.red,
          inactiveTickColor: Colors.green,
          activeMinorTickColor: Colors.red,
          inactiveMinorTickColor: Colors.green,
          activeDivisorColor: Colors.blue,
          inactiveDivisorColor: Colors.red,
          activeLabelStyle: TextStyle(color: Colors.red, fontSize: 12),
          inactiveLabelStyle: TextStyle(color: Colors.green, fontSize: 12),
          tooltipBackgroundColor: Colors.green),
      child: SfSlider(
        min: _dateMin,
        max: _dateMax,
        showLabels: true,
        interval: 2,
        showTicks: true,
        showDivisors: true,
        dateIntervalType: DateIntervalType.months,
        dateFormat: DateFormat.yM(),
        value: _dateValues,
        onChanged: (value) {
          setState(() {
            _dateValues = value;
          });
        },
      ),
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
                _getAlignedTextWidget('Numeric slider',
                    fontSize: 22, fontWeight: FontWeight.bold),
                sizedBox,
                _getAlignedTextWidget('Color customization'),
                numericDefaultMin,
                sizedBox,
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                sizedBox,
                _getAlignedTextWidget('DateTime slider',
                    fontSize: 22, fontWeight: FontWeight.bold),
                sizedBox,
                _getAlignedTextWidget('Color customization'),
                dateDefault,
                sizedBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
