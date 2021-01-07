import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart' show DateFormat;

class SliderDefaultWithLabelsIntervalPage extends StatefulWidget {
  @override
  _SliderDefaultWithLabelsIntervalPageState createState() =>
      _SliderDefaultWithLabelsIntervalPageState();
}

class _SliderDefaultWithLabelsIntervalPageState
    extends State<SliderDefaultWithLabelsIntervalPage> {
  DateTime _dateMin = DateTime(2010, 01, 01);
  DateTime _dateMax = DateTime(2015, 01, 01);
  DateTime _dateValues = DateTime(2012, 01, 01);
  double _numValues = 0.3;
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

  SfSlider get numericDefault {
    // ignore: missing_required_param
    return SfSlider(
      value: _numValues,
      showLabels: true,
      enableTooltip: true,
      interval: 0.2,
    );
  }

  SfSlider get numericDefaultMin {
    return SfSlider(
      value: _numValues,
      showLabels: true,
      enableTooltip: true,
      showTicks: true,
      interval: 0.2,
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
      interval: 1,
      dateIntervalType: DateIntervalType.years,
      dateFormat: DateFormat.y(),
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
                _getAlignedTextWidget('Inactive'),
                numericDefault,
                sizedBox,
                _getAlignedTextWidget('Default MinMax'),
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
                _getAlignedTextWidget('Default'),
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
