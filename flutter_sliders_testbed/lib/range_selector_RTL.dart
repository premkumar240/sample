import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSelectorRTLSample extends StatefulWidget {
  @override
  _RangeSelectorRTLSampleState createState() => _RangeSelectorRTLSampleState();
}

class _RangeSelectorRTLSampleState extends State<RangeSelectorRTLSample> {
  double _min = 0.0;
  double _max = 100.0;
  SfRangeValues _syncValues = SfRangeValues(30.0, 70.0);
  double sizeBoxHeight = 20;

  Directionality get rangeSelectorLTR => Directionality(
        textDirection: TextDirection.ltr,
        child: SfRangeSelectorTheme(
          data: SfRangeSelectorThemeData(
            activeDivisorColor: Colors.red,
            activeDivisorRadius: 5,
            activeDivisorStrokeColor: Colors.green,
            activeDivisorStrokeWidth: 1,
            activeLabelStyle: TextStyle(color: Colors.red, fontSize: 12),
            activeMinorTickColor: Colors.red,
            activeTickColor: Colors.red,
            activeTrackColor: Colors.red,
            activeRegionColor: Colors.red[200],
            inactiveDivisorColor: Colors.green,
            inactiveDivisorRadius: 8,
            inactiveDivisorStrokeColor: Colors.red,
            inactiveDivisorStrokeWidth: 3,
            inactiveLabelStyle: TextStyle(color: Colors.green, fontSize: 12),
            inactiveMinorTickColor: Colors.green,
            inactiveTickColor: Colors.green,
            inactiveTrackColor: Colors.green,
            inactiveRegionColor: Colors.green[200],
          ),
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
            dragMode: SliderDragMode.onThumb,
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
            initialValues: _syncValues,
            onChanged: (value) {},
          ),
        ),
      );

  Directionality get rangeSelectorRTL => Directionality(
        textDirection: TextDirection.rtl,
        child: SfRangeSelectorTheme(
          data: SfRangeSelectorThemeData(
            activeDivisorColor: Colors.red,
            activeDivisorRadius: 5,
            activeDivisorStrokeColor: Colors.green,
            activeDivisorStrokeWidth: 1,
            activeLabelStyle: TextStyle(color: Colors.red, fontSize: 12),
            activeMinorTickColor: Colors.red,
            activeTickColor: Colors.red,
            activeTrackColor: Colors.red,
            activeRegionColor: Colors.red[200],
            inactiveDivisorColor: Colors.green,
            inactiveDivisorRadius: 8,
            inactiveDivisorStrokeColor: Colors.red,
            inactiveDivisorStrokeWidth: 3,
            inactiveLabelStyle: TextStyle(color: Colors.green, fontSize: 12),
            inactiveMinorTickColor: Colors.green,
            inactiveTickColor: Colors.green,
            inactiveTrackColor: Colors.green,
            inactiveRegionColor: Colors.green[200],
          ),
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
              color: Colors.white,
              size: 20,
            ),
            endThumbIcon: Icon(
              Icons.help,
              color: Colors.black,
              size: 20,
            ),
            initialValues: _syncValues,
            onChanged: (value) {},
          ),
        ),
      );

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

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
                Text('Range selector LTR'),
                sizedBox,
                rangeSelectorLTR,
                sizedBox,
                Text('Range selector RTL'),
                sizedBox,
                rangeSelectorRTL,
                sizedBox,
              ],
            ),
          ],
        ),
      )),
    );
  }
}
