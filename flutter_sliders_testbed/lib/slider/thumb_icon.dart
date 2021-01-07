import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderThumbIconPage extends StatefulWidget {
  @override
  _SliderThumbIconPageState createState() => _SliderThumbIconPageState();
}

class _SliderThumbIconPageState extends State<SliderThumbIconPage> {
  double _min = 0.0;
  double _max = 100.0;
  double _syncValues = 50.0;
  double sizeBoxHeight = 20;

  DateTime dateTimeMin = DateTime(2000, 01, 01);
  DateTime dateTimeMax = DateTime(2005, 12, 31, 24);
  DateTime _dateTimeValues = DateTime(2000, 01, 01);

  double activetrack = 15;
  double inactive = 25;

  SfSliderTheme get defaultRangeSliderTheme => SfSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          value: _syncValues,
          thumbIcon: Container(
            child: Icon(
              Icons.help,
              color: Colors.red,
              size: 20,
            ),
            color: Colors.red.withOpacity(0.2),
          ),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfSliderTheme get defaultRangeSliderTheme1 => SfSliderTheme(
        data: SfRangeSliderThemeData(thumbRadius: 20),
        child: SfSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          value: _syncValues,
          thumbIcon: Icon(
            Icons.help,
            color: Colors.red,
          ),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfSliderTheme get defaultRangeSliderTheme2 => SfSliderTheme(
        data: SfRangeSliderThemeData(thumbRadius: 20),
        child: SfSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          value: _syncValues,
          thumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 40.0,
          ),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfSliderTheme get defaultRangeSliderTheme3 => SfSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          value: _syncValues,
          thumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 20,
          ),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfSliderTheme get activeRangeSlider => SfSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfSlider(
          min: dateTimeMin,
          max: dateTimeMax,
          showLabels: true,
          showTicks: true,
          showDivisors: true,
          enableTooltip: true,
          interval: 1,
          minorTicksPerInterval: 2,
          dateIntervalType: DateIntervalType.years,
          dateFormat: DateFormat.y(),
          value: _dateTimeValues,
          onChanged: (dynamic value) {
            setState(() {
              _dateTimeValues = value;
            });
          },
        ),
      );

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample slider demo'),
      ),
      body: (Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                sizedBox,
                Text('Default slider with thumb icon size 20'),
                sizedBox,
                defaultRangeSliderTheme,
                sizedBox,
                Text('Slider thumb icon with thumb radius 20'),
                sizedBox,
                defaultRangeSliderTheme1,
                sizedBox,
                Text('Slider with thumb icon size 40 with thumb radius 20'),
                sizedBox,
                defaultRangeSliderTheme2,
                sizedBox,
              ],
            ),
          ],
        ),
      )),
    );
  }
}
