import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderDefaultPage extends StatefulWidget {
  @override
  _SliderDefaultPageState createState() => _SliderDefaultPageState();
}

class _SliderDefaultPageState extends State<SliderDefaultPage> {
  DateTime _dateMin = DateTime(2010, 01, 01);
  DateTime _dateMax = DateTime(2015, 01, 01);
  DateTime _dateValues = DateTime(2012, 01, 01);
  double _numValues = 0.3;
  double _numDefaultValues = 0.3;
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

  SfSlider get numericDisabled {
    // ignore: missing_required_param
    return SfSlider(
      value: _numDefaultValues,
    );
  }

  SfSlider get numericDefaultLabel {
    return SfSlider(
      value: _numDefaultValues,
      showLabels: true,
      showTicks: true,
      enableTooltip: true,
      onChanged: (dynamic value) {
        setState(() {
          _numDefaultValues = value;
        });
      },
    );
  }

  SfSlider get numericDefaultMin {
    return SfSlider(
      value: _numValues,
      enableTooltip: true,
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
      value: _dateValues,
      enableTooltip: true,
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
        title: Text(' slider'),
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
                numericDisabled,
                sizedBox,
                _getAlignedTextWidget('Default MinMax'),
                numericDefaultMin,
                sizedBox,
                _getAlignedTextWidget('First and last Label'),
                numericDefaultLabel,
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
