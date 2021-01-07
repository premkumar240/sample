import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderPage extends StatefulWidget {
  @override
  _RangeSliderPageState createState() => _RangeSliderPageState();
}

class _RangeSliderPageState extends State<RangeSliderPage> {
  double _min = 0.0;
  double _max = 100.0;
  RangeValues _values = RangeValues(30.0, 70.0);
  SfRangeValues _syncValues = SfRangeValues(30.0, 70.0);
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

  RangeSlider get frameworkRangeSlider => RangeSlider(
        min: _min,
        max: _max,
        values: _values,
        onChanged: (value) {
          setState(() {
            _values = value;
          });
        },
      );

  RangeSlider get frameworkDiscreteRangeSlider => RangeSlider(
        min: _min,
        max: _max,
        values: _values,
        divisions: 5,
        onChanged: (value) {
          setState(() {
            _values = value;
          });
        },
      );

  SliderTheme get frameworkThemeSlider => SliderTheme(
        data: SliderThemeData(
          inactiveTrackColor: Colors.deepPurple.withOpacity(0.24),
          activeTrackColor: Colors.deepPurple,
          thumbColor: Colors.deepPurple,
          overlayColor: Colors.deepPurple.withOpacity(0.12),
        ),
        child: frameworkRangeSlider,
      );

  SfRangeSlider get syncDefaultRangeSlider {
    return SfRangeSlider(
      min: _min,
      max: _max,
      values: _syncValues,
      onChanged: (value) {
        setState(() {
          _syncValues = value;
        });
      },
    );
  }

  SfTheme get theme => SfTheme(
        data: SfThemeData(
            rangeSliderThemeData: SfRangeSliderThemeData(
                activeTrackHeight: 15, inactiveTrackHeight: 15)),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          values: _syncValues,
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfRangeSelectorTheme get rangeSliderTheme => SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(
            activeTrackHeight: 15, inactiveTrackHeight: 15),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          values: _syncValues,
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfRangeSlider get syncRangeSlider {
    return SfRangeSlider(
      min: _min,
      max: _max,
      showLabels: true,
      showTicks: true,
      interval: 20,
      values: _syncValues,
      onChanged: (value) {
        setState(() {
          _syncValues = value;
        });
      },
    );
  }

  SfRangeSlider get syncLockRangeSlider {
    return SfRangeSlider(
      min: _min,
      max: _max,
      showLabels: true,
      showTicks: true,
      interval: 20,
      values: _syncValues,
      onChanged: (value) {
        setState(() {
          _syncValues = value;
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
                sizedBox,
                _getAlignedTextWidget('Framework range slider',
                    fontSize: 22, fontWeight: FontWeight.bold),
                sizedBox,
                _getAlignedTextWidget('Default'),
                frameworkRangeSlider,
                sizedBox,
                _getAlignedTextWidget('Discrete range slider'),
                frameworkDiscreteRangeSlider,
                sizedBox,
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                sizedBox,
                _getAlignedTextWidget('Syncfusion range slider',
                    fontSize: 22, fontWeight: FontWeight.bold),
                sizedBox,
                _getAlignedTextWidget('Default'),
                theme,
                rangeSliderTheme,
                sizedBox,
                _getAlignedTextWidget('Range slider with division'),
                syncRangeSlider,
                sizedBox,
                _getAlignedTextWidget('Lock range slider'),
                syncLockRangeSlider,
                sizedBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
