import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart' show DateFormat;

class DateDiscreteRangeSliderPage extends StatefulWidget {
  @override
  _DateDiscreteRangeSliderPageState createState() =>
      _DateDiscreteRangeSliderPageState();
}

class _DateDiscreteRangeSliderPageState
    extends State<DateDiscreteRangeSliderPage> {
  DateTime _yearMin = DateTime(2015, 01, 01);
  DateTime _yearMax = DateTime(2020, 01, 01);

  DateTime _monthMin = DateTime(2000, 01, 01);
  DateTime _monthMax = DateTime(2000, 12, 31);

  DateTime _dayMin = DateTime(2000, 03, 01);
  DateTime _dayMax = DateTime(2000, 03, 31);

  SfRangeValues _numericValues = SfRangeValues(2.3, 4.7);
  SfRangeValues _yearValues =
      SfRangeValues(DateTime(2017, 04, 01), DateTime(2018, 08, 01));
  SfRangeValues _monthValues =
      SfRangeValues(DateTime(2000, 04, 01), DateTime(2000, 08, 01));
  SfRangeValues _dayValues =
      SfRangeValues(DateTime(2000, 03, 09), DateTime(2000, 03, 17));
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
        padding: EdgeInsets.only(left: 10),
      ),
    );
  }

  SfRangeSlider get numericDateRangeSlider {
    return SfRangeSlider(
      min: 0.0,
      max: 10.0,
      stepSize: 1,
      values: _numericValues,
      interval: 2,
      enableTooltip: true,
      showLabels: true,
      showTicks: true,
      minorTicksPerInterval: 1,
      onChanged: (SfRangeValues newValues) {
        setState(() {
          _numericValues = newValues;
        });
      },
    );
  }

  SfRangeSlider get discreteYearDateRangeSlider {
    return SfRangeSlider(
      min: _yearMin,
      max: _yearMax,
      values: _yearValues,
      enableTooltip: true,
      stepDuration: SliderStepDuration(years: 1, months: 6),
      interval: 2,
      showLabels: true,
      showTicks: true,
      minorTicksPerInterval: 1,
      dateIntervalType: DateIntervalType.years,
      dateFormat: DateFormat.yMd(),
      onChanged: (SfRangeValues newValues) {
        setState(() {
          _yearValues = newValues;
        });
      },
    );
  }

  SfRangeSlider get discreteMonthDateRangeSlider {
    return SfRangeSlider(
      min: _monthMin,
      max: _monthMax,
      values: _monthValues,
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
      onChanged: (SfRangeValues newValues) {
        setState(() {
          _monthValues = newValues;
        });
      },
    );
  }

  SfRangeSlider get discreteDayDateRangeSlider {
    return SfRangeSlider(
      min: _dayMin,
      max: _dayMax,
      values: _dayValues,
      stepDuration: SliderStepDuration(days: 7, hours: 24),
      interval: 7,
      showLabels: true,
      showTicks: true,
      enableTooltip: true,
      dateIntervalType: DateIntervalType.days,
      dateFormat: DateFormat.yMd(),
      onChanged: (SfRangeValues newValues) {
        setState(() {
          _dayValues = newValues;
        });
      },
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
                _getAlignedTextWidget('Discrete numeric range slider'),
                numericDateRangeSlider,
                sizedBox,
                _getAlignedTextWidget('Discrete year difference'),
                discreteYearDateRangeSlider,
                sizedBox,
                _getAlignedTextWidget('Discrete month difference'),
                discreteMonthDateRangeSlider,
                sizedBox,
                _getAlignedTextWidget('Discrete day difference'),
                discreteDayDateRangeSlider,
                sizedBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
