import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SampleRangeSelectorPage extends StatefulWidget {
  @override
  _SampleRangeSelectorPageState createState() =>
      _SampleRangeSelectorPageState();
}

class _SampleRangeSelectorPageState extends State<SampleRangeSelectorPage> {
  double _min = 0.0;
  double _max = 100.0;
  SfRangeValues _syncValues = SfRangeValues(30.0, 70.0);

  DateTime _dateTimeMin = DateTime(2000, 01, 01);
  DateTime _dateTimeMax = DateTime(2005, 12, 31, 24);
  SfRangeValues _dateTimeValues =
      SfRangeValues(DateTime(2000, 01, 01), DateTime(2000, 12, 31, 24));

  SfRangeSelectorTheme get defaultRangeSelector => SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(),
        child: SfRangeSelector(
          child: Container(
            height: 100,
          ),
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          startThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 20,
          ),
          endThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 20,
          ),
          initialValues: _syncValues,
          onChanged: (value) {},
        ),
      );

  SfRangeSelectorTheme get activeRangeSelector => SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(thumbRadius: 20),
        child: SfRangeSelector(
          child: Container(
            height: 100,
          ),
          min: _dateTimeMin,
          max: _dateTimeMax,
          enabled: true,
          initialValues: _dateTimeValues,
          interval: 1,
          dateIntervalType: DateIntervalType.years,
          dateFormat: DateFormat.y(),
          showTicks: true,
          showLabels: true,
          showDivisors: true,
          startThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
          ),
          endThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
          ),
          onChanged: (values) {},
        ),
      );

  SfRangeSelectorTheme get defaultRangeSelector1 => SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(thumbRadius: 20),
        child: SfRangeSelector(
          child: Container(
            height: 100,
          ),
          min: _min,
          max: _max,
          interval: 20,
          showDivisors: true,
          enableTooltip: true,
          showLabels: true,
          showTicks: true,
          startThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 40,
          ),
          endThumbIcon: Icon(
            Icons.help,
            color: Colors.red,
            size: 40,
          ),
          initialValues: _syncValues,
          onChanged: (value) {},
        ),
      );

  SfRangeSelectorTheme get activeRangeSelector1 => SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(
            thumbRadius: 20,
            overlayRadius: 0,
            inactiveRegionColor: Colors.blue.withOpacity(0.3)),
        child: SfRangeSelector(
          child: Container(
            height: 100,
          ),
          min: _dateTimeMin,
          max: _dateTimeMax,
          enabled: true,
          initialValues: _dateTimeValues,
          interval: 1,
          dateIntervalType: DateIntervalType.years,
          dateFormat: DateFormat.y(),
          showTicks: true,
          showLabels: true,
          showDivisors: true,
          thumbShape: ThumbShape(),
          startThumbIcon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.red,
          ),
          endThumbIcon: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.red,
          ),
          onChanged: (values) {},
        ),
      );

  Widget get sizedBox => SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Range selector demo'),
      ),
      body: (Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                sizedBox,
                Text('Default range selector with thumb icon'),
                sizedBox,
                defaultRangeSelector,
                sizedBox,
                Text('Range selector with thumb radius 20 and thumb icon'),
                sizedBox,
                activeRangeSelector,
                sizedBox,
                defaultRangeSelector1,
                sizedBox,
                Text('Default range selector'),
                sizedBox,
                activeRangeSelector1,
                sizedBox,
                Text('icon'),
                sizedBox,
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class ThumbShape extends SfThumbShape {
  @override
  void paint(PaintingContext context, Offset center,
      {RenderBox parentBox,
      RenderBox child,
      themeData,
      SfRangeValues currentValues,
      currentValue,
      Paint paint,
      Animation<double> enableAnimation,
      TextDirection textDirection,
      SfThumb thumb}) {
    super.paint(context, center,
        parentBox: parentBox,
        child: child,
        themeData: themeData,
        currentValues: currentValues,
        currentValue: currentValue,
        paint: paint,
        enableAnimation: enableAnimation,
        textDirection: textDirection,
        thumb: thumb);
  }
}
