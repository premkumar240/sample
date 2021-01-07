import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderLabelPlacementPage extends StatefulWidget {
  @override
  _SliderLabelPlacementPageState createState() =>
      _SliderLabelPlacementPageState();
}

class _SliderLabelPlacementPageState extends State<SliderLabelPlacementPage> {
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

  SfSlider get numericDefaultMin {
    return SfSlider(
      min: _min,
      max: _max,
      value: _numValues,
      showLabels: true,
      enableTooltip: true,
      showTicks: true,
      labelPlacement: LabelPlacement.betweenTicks,
      interval: 10,
      onChanged: (dynamic value) {
        setState(() {
          _numValues = value;
        });
      },
    );
  }

  SfSlider get dateDefault {
    return SfSlider(
      min: _dateMin,
      max: _dateMax,
      showLabels: true,
      enableTooltip: true,
      labelPlacement: LabelPlacement.betweenTicks,
      interval: 3,
      showTicks: true,
      dateIntervalType: DateIntervalType.months,
      dateFormat: DateFormat.yM(),
      value: _dateValues,
      onChanged: (dynamic value) {
        setState(() {
          _dateValues = value;
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
                _getAlignedTextWidget('Numeric slider',
                    fontSize: 22, fontWeight: FontWeight.bold),
                sizedBox,
                _getAlignedTextWidget('LabelPlacement value'),
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
                _getAlignedTextWidget('LabelPlacement value'),
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
