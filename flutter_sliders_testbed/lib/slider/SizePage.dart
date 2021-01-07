import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderSizePage extends StatefulWidget {
  @override
  _SliderSizePageState createState() => _SliderSizePageState();
}

class _SliderSizePageState extends State<SliderSizePage> {
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
        activeTrackHeight: 20,
        thumbRadius: 15,
        overlayRadius: 30,
        trackCornerRadius: 15,
        minorTickSize: const Size(7, 15),
        tickSize: const Size(7, 30),
        activeLabelStyle: TextStyle(fontSize: 20, color: Colors.blue),
        inactiveLabelStyle: TextStyle(fontSize: 20, color: Colors.blue),
      ),
      child: SfSlider(
        min: _min,
        max: _max,
        value: _numValues,
        showLabels: true,
        showDivisors: true,
        minorTicksPerInterval: 1,
        showTicks: true,
        enableTooltip: true,
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
        activeTrackHeight: 20,
        inactiveTrackHeight: 10,
        thumbRadius: 15,
        overlayRadius: 30,
        trackCornerRadius: 15,
        minorTickSize: const Size(7, 15),
        tickSize: const Size(7, 30),
        activeLabelStyle: TextStyle(fontSize: 20, color: Colors.blue),
        inactiveLabelStyle: TextStyle(fontSize: 20, color: Colors.blue),
      ),
      child: SfSlider(
        min: _dateMin,
        max: _dateMax,
        showLabels: true,
        interval: 4,
        minorTicksPerInterval: 1,
        showTicks: true,
        enableTooltip: true,
        dateIntervalType: DateIntervalType.months,
        dateFormat: DateFormat.yM(),
        value: _dateValues,
        onChanged: (dynamic value) {
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
                _getAlignedTextWidget('Size customization'),
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
                _getAlignedTextWidget('Size customization'),
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
