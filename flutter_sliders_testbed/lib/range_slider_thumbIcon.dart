import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart' show DateFormat;

class SampleRangeSliderPage extends StatefulWidget {
  @override
  _SampleRangeSliderPageState createState() => _SampleRangeSliderPageState();
}

class _SampleRangeSliderPageState extends State<SampleRangeSliderPage> {
  double _min = 0.0;
  double _max = 100.0;
  SfRangeValues _syncValues = SfRangeValues(30.0, 70.0);
  double sizeBoxHeight = 20;

  DateTime dateTimeMin = DateTime(2000, 01, 01);
  DateTime dateTimeMax = DateTime(2005, 12, 31, 24);
  SfRangeValues _dateTimeValues =
      SfRangeValues(DateTime(2000, 01, 01), DateTime(2000, 12, 31, 24));

  double activetrack = 15;
  double inactive = 25;

  SfRangeSliderTheme get defaultRangeSliderTheme => SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          values: _syncValues,
          startThumbIcon: Container(
            child: Icon(
              Icons.help,
              color: Colors.red,
              size: 20,
            ),
            color: Colors.red.withOpacity(0.2),
          ),
          endThumbIcon: Icon(
            Icons.help,
            size: 20,
            color: Colors.red,
          ),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfRangeSliderTheme get defaultRangeSliderTheme1 => SfRangeSliderTheme(
        data: SfRangeSliderThemeData(thumbRadius: 20),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          values: _syncValues,
          startThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
          ),
          endThumbIcon: Icon(
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

  SfRangeSliderTheme get defaultRangeSliderTheme2 => SfRangeSliderTheme(
        data: SfRangeSliderThemeData(thumbRadius: 20),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          values: _syncValues,
          startThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 40.0,
          ),
          endThumbIcon: Icon(
            Icons.help,
            size: 40.0,
            color: Colors.red,
          ),
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfRangeSliderTheme get defaultRangeSliderTheme3 => SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider(
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          values: _syncValues,
          startThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 20,
          ),
          endThumbIcon: Icon(
            Icons.home,
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

  SfRangeSliderTheme get activeRangeSlider => SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider(
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
          values: _dateTimeValues,
          onChanged: (value) {
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
        title: Text('Sample Range slider demo'),
      ),
      body: (Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                sizedBox,
                Text('Default Range slider with thumb icon size 20'),
                sizedBox,
                defaultRangeSliderTheme,
                sizedBox,
                Text('Range slider thumb icon with thumb radius 20'),
                sizedBox,
                defaultRangeSliderTheme1,
                sizedBox,
                Text(
                    'Range slider with thumb icon size 40 with thumb radius 20'),
                sizedBox,
                defaultRangeSliderTheme2,
                sizedBox,
                Text('Range slider with differentstart and end thumb icon'),
                sizedBox,
                defaultRangeSliderTheme3,
                sizedBox,
              ],
            ),
          ],
        ),
      )),
    );
  }
}
