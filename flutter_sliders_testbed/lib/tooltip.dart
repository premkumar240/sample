import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TooltipSliderPage extends StatefulWidget {
  @override
  _TooltipSliderPageState createState() => _TooltipSliderPageState();
}

class _TooltipSliderPageState extends State<TooltipSliderPage> {
  double _min = 0.0;
  double _max = 100.0;
  SfRangeValues _syncValues = SfRangeValues(50.0, 55.0);

  double _syncValue = 50.0;
  double sizeBoxHeight = 30;
  RangeValues _values = RangeValues(30.0, 70.0);

  double numericMin = 50.0;
  double numericMax = 100.0;
  SfRangeValues _numericValues = SfRangeValues(55.0, 66.0);

  double _fontSize = 10.0;
  double _thumbSize = 10.0;

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

  RangeSlider get frameworkRangeSlider => RangeSlider(
        min: _min,
        max: _max,
        values: _values,
        labels: RangeLabels('${_values.start.round()}', '${_values.end}'),
        onChanged: (value) {
          setState(() {
            _values = value;
          });
        },
      );

  SliderTheme get frameworkThemeSlider => SliderTheme(
        data: SliderThemeData(
          trackHeight: 12,
          showValueIndicator: ShowValueIndicator.onlyForContinuous,
          rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
        ),
        child: frameworkRangeSlider,
      );

  SfRangeSliderTheme get rangeSliderTheme => SfRangeSliderTheme(
        data: SfRangeSliderThemeData(
            thumbRadius: _thumbSize,
            tooltipTextStyle: TextStyle(fontSize: 14),
            tooltipBackgroundColor: Colors.red),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          interval: 20,
          showTicks: true,
          showLabels: true,
          values: _syncValues,
          enableTooltip: true,
          tooltipShape: SfPaddleTooltipShape(),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfRangeSliderTheme get rangeSliderTheme2 => SfRangeSliderTheme(
        data: SfRangeSliderThemeData(
            activeTrackHeight: 10,
            inactiveTrackHeight: 10,
            thumbRadius: 10,
            overlayRadius: 0),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          interval: 20,
          showTicks: true,
          showLabels: true,
          values: _syncValues,
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualValue, String formattedText) {
            return actualValue.toStringAsFixed(0);
          },
          tooltipShape: SfPaddleTooltipShape(),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfSliderTheme get defaultRangeSliderTheme => SfSliderTheme(
        data: SfRangeSliderThemeData(
            thumbRadius: _thumbSize,
            tooltipTextStyle: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontSize: _fontSize)),
        child: SfSlider(
          min: _min,
          max: _max,
          interval: 20,
          enableTooltip: true,
          value: _syncValue,
          tooltipTextFormatterCallback:
              (dynamic actualValue, String formattedText) {
            return actualValue.toStringAsFixed(0);
          },
          tooltipShape: SfPaddleTooltipShape(),
          onChanged: (value) {
            setState(() {
              _syncValue = value;
            });
          },
        ),
      );

  SfRangeSelectorTheme get numericRangeSelector1 => SfRangeSelectorTheme(
        child: SfRangeSelector(
          min: numericMin,
          max: numericMax,
          initialValues: _numericValues,
          interval: 10,
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualValue, String formattedText) {
            return actualValue.toStringAsFixed(8);
          },
          tooltipShape: SfPaddleTooltipShape(),
          child: Container(
            height: 50,
          ),
        ),
        data: SfRangeSelectorThemeData(
          thumbRadius: _thumbSize,
          tooltipTextStyle: TextStyle(fontSize: _fontSize),
        ),
      );

  SfSliderTheme get fontSizeRangeSliderTheme => SfSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfSlider(
          min: 0.0,
          max: 25.0,
          stepSize: 1,
          enableTooltip: true,
          value: _fontSize,
          tooltipShape: SfPaddleTooltipShape(),
          onChanged: (value) {
            setState(() {
              _fontSize = value;
            });
          },
        ),
      );

  SfSliderTheme get thumbSizeRangeSliderTheme => SfSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfSlider(
          min: 0.0,
          max: 25.0,
          stepSize: 1,
          enableTooltip: true,
          value: _thumbSize,
          tooltipShape: SfPaddleTooltipShape(),
          onChanged: (value) {
            setState(() {
              _thumbSize = value;
            });
          },
        ),
      );

  Widget get sizedBox => SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Range slider demo'),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      sizedBox,
                      Text(
                        'Paddle tooltip',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      sizedBox,
                      _getAlignedTextWidget('Framework Paddle tooltip'),
                      frameworkThemeSlider,
                      sizedBox,
                      _getAlignedTextWidget('SfSlider Paddle tooltip'),
                      defaultRangeSliderTheme,
                      sizedBox,
                      sizedBox,
                      _getAlignedTextWidget('SfRange slider Paddle tooltip'),
                      rangeSliderTheme,
                      sizedBox,
                      sizedBox,
                      _getAlignedTextWidget('SfRange slider Paddle tooltip'),
                      rangeSliderTheme2,
                      sizedBox,
                      _getAlignedTextWidget('SfRange selector Paddle tooltip'),
                      numericRangeSelector1,
                      sizedBox,
                      _getAlignedTextWidget(
                          'Font size ${_fontSize.toString()}'),
                      fontSizeRangeSliderTheme,
                      sizedBox,
                      _getAlignedTextWidget(
                          'Thumb size ${_thumbSize.toString()}'),
                      thumbSizeRangeSliderTheme,
                      sizedBox,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
