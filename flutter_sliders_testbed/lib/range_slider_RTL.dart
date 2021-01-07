import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderRTLSample extends StatefulWidget {
  @override
  _RangeSliderRTLSampleState createState() => _RangeSliderRTLSampleState();
}

class _RangeSliderRTLSampleState extends State<RangeSliderRTLSample> {
  double _min = 0.0;
  double _max = 100.0;
  SfRangeValues _syncValues = SfRangeValues(30.0, 70.0);
  double sizeBoxHeight = 20;

  Directionality get rangeSliderLRT => Directionality(
        textDirection: TextDirection.ltr,
        child: SfRangeSliderTheme(
          data: SfRangeSliderThemeData(
            activeDivisorColor: Colors.red,
            activeDivisorRadius: 5,
            activeDivisorStrokeColor: Colors.green,
            activeDivisorStrokeWidth: 1,
            activeLabelStyle: TextStyle(color: Colors.red, fontSize: 12),
            activeMinorTickColor: Colors.red,
            activeTickColor: Colors.red,
            activeTrackColor: Colors.red,
            inactiveDivisorColor: Colors.green,
            inactiveDivisorRadius: 8,
            inactiveDivisorStrokeColor: Colors.red,
            inactiveDivisorStrokeWidth: 3,
            inactiveLabelStyle: TextStyle(color: Colors.green, fontSize: 12),
            inactiveMinorTickColor: Colors.green,
            inactiveTickColor: Colors.green,
            inactiveTrackColor: Colors.green,
          ),
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
              color: Colors.white,
              size: 20,
            ),
            endThumbIcon: Icon(
              Icons.help,
              color: Colors.black,
              size: 20,
            ),
            onChanged: (value) {
              setState(() {
                _syncValues = value;
              });
            },
          ),
        ),
      );

  Directionality get rangeSliderRTL => Directionality(
        textDirection: TextDirection.rtl,
        child: SfRangeSliderTheme(
          data: SfRangeSliderThemeData(
            activeDivisorColor: Colors.red,
            activeDivisorRadius: 5,
            activeDivisorStrokeColor: Colors.green,
            activeDivisorStrokeWidth: 1,
            activeLabelStyle: TextStyle(color: Colors.red, fontSize: 12),
            activeMinorTickColor: Colors.red,
            activeTickColor: Colors.red,
            activeTrackColor: Colors.red,
            inactiveDivisorColor: Colors.green,
            inactiveDivisorRadius: 8,
            inactiveDivisorStrokeColor: Colors.red,
            inactiveDivisorStrokeWidth: 3,
            inactiveLabelStyle: TextStyle(color: Colors.green, fontSize: 12),
            inactiveMinorTickColor: Colors.green,
            inactiveTickColor: Colors.green,
            inactiveTrackColor: Colors.green,
          ),
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
              color: Colors.white,
              size: 20,
            ),
            endThumbIcon: Icon(
              Icons.help,
              color: Colors.black,
              size: 20,
            ),
            onChanged: (value) {
              setState(() {
                _syncValues = value;
              });
            },
          ),
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
                Text('Range slider LTR'),
                sizedBox,
                rangeSliderLRT,
                sizedBox,
                Text('Range slider RTL'),
                sizedBox,
                rangeSliderRTL,
                sizedBox,
              ],
            ),
          ],
        ),
      )),
    );
  }
}
