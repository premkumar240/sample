import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_core/core.dart';

class DateDiscreteRangeSelectorPage extends StatefulWidget {
  @override
  _DateDiscreteRangeSelectorPageState createState() =>
      _DateDiscreteRangeSelectorPageState();
}

class _DateDiscreteRangeSelectorPageState
    extends State<DateDiscreteRangeSelectorPage> {
  DateTime _yearMin = DateTime(2015, 01, 01);
  DateTime _yearMax = DateTime(2020, 01, 01);

  DateTime _monthMin = DateTime(2000, 01, 01);
  DateTime _monthMax = DateTime(2000, 12, 31);

  SfRangeValues _yearValues =
      SfRangeValues(DateTime(2017, 04, 01), DateTime(2018, 08, 01));
  SfRangeValues _monthValues =
      SfRangeValues(DateTime(2000, 04, 01), DateTime(2000, 08, 01));
  double sizeBoxHeight = 20;

  RangeController _rangeController;

  @override
  void initState() {
    super.initState();
    _rangeController =
        RangeController(start: _yearValues.start, end: _yearValues.end);
  }

  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

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

  SfRangeSelector get discreteYearDateRangeSlider {
    return SfRangeSelector(
      min: _yearMin,
      max: _yearMax,
      controller: _rangeController,
      enableTooltip: true,
      dragMode: SliderDragMode.betweenThumbs,
      stepDuration: SliderStepDuration(years: 1),
      interval: 2,
      showLabels: true,
      showTicks: true,
      minorTicksPerInterval: 1,
      dateIntervalType: DateIntervalType.years,
      dateFormat: DateFormat.yMd(),
      child: Container(
        color: Colors.pink[100],
        height: 150,
      ),
    );
  }

  SfRangeSelector get discreteMonthDateRangeSlider {
    return SfRangeSelector(
      min: _monthMin,
      max: _monthMax,
      initialValues: _monthValues,
      stepDuration: SliderStepDuration(months: 1),
      interval: 2,
      showLabels: true,
      showTicks: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      dateIntervalType: DateIntervalType.months,
      dateFormat: DateFormat.yM(),
      tooltipTextFormatterCallback:
          (dynamic actualValue, String formattedText) {
        return DateFormat('d/MMM').format(actualValue);
      },
      child: Container(
        color: Colors.pink[100],
        height: 150,
      ),
    );
  }

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Range slider demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getAlignedTextWidget('Discrete with controller value'),
                sizedBox,
                discreteYearDateRangeSlider,
                sizedBox,
                _getAlignedTextWidget('Discrete with initial value'),
                sizedBox,
                discreteMonthDateRangeSlider,
                sizedBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
