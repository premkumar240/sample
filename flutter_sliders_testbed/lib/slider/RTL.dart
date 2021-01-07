import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderRTLPage extends StatefulWidget {
  @override
  _SliderRTLPageState createState() => _SliderRTLPageState();
}

class _SliderRTLPageState extends State<SliderRTLPage> {
  double _min = 20;
  double _max = 90;
  DateTime _dateMin = DateTime(2010, 01, 01);
  DateTime _dateMax = DateTime(2010, 12, 01);
  DateTime _dateValues = DateTime(2010, 05, 01);
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

  Directionality get numericDefaultMin {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: SfSliderTheme(
          data: SfRangeSliderThemeData(
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.green,
            thumbColor: Colors.red,
            activeDivisorRadius: 5,
            inactiveDivisorRadius: 5,
            thumbStrokeWidth: 3,
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
            minorTicksPerInterval: 1,
            showTicks: true,
            interval: 10,
            onChanged: (dynamic value) {
              setState(() {
                _numValues = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Directionality get dateDefault {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: SfSliderTheme(
          data: SfRangeSliderThemeData(
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.green,
              thumbColor: Colors.red,
              thumbStrokeWidth: 3,
              thumbStrokeColor: Colors.blue,
              activeDivisorStrokeWidth: 2,
              inactiveDivisorStrokeWidth: 2,
              activeDivisorStrokeColor: Colors.blue,
              inactiveDivisorStrokeColor: Colors.red,
              activeDivisorRadius: 5,
              inactiveDivisorRadius: 5,
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
            minorTicksPerInterval: 1,
            dateIntervalType: DateIntervalType.months,
            dateFormat: DateFormat.yM(),
            value: _dateValues,
            onChanged: (value) {
              setState(() {
                _dateValues = value;
              });
            },
          ),
        ),
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
