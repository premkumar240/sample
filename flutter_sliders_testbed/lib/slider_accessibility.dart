import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderAccessibilityPage extends StatefulWidget {
  @override
  _SliderAccessibilityPageState createState() =>
      _SliderAccessibilityPageState();
}

class _SliderAccessibilityPageState extends State<SliderAccessibilityPage> {
  RangeValues _value = RangeValues(40.0, 60.0);
  SfRangeValues _syncValue = SfRangeValues(40.0, 60.0);
  double _value1 = 40.0;
  double _frameworkValue = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider page'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Slider(
              min: 0.0,
              max: 100.0,
              value: _frameworkValue,
              divisions: 5,
              onChanged: (dynamic value) {
                setState(() {
                  _frameworkValue = value;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            SfSlider(
              min: 0.0,
              max: 100.0,
              value: _value1,
              interval: 20,
              showLabels: true,
              onChanged: (dynamic value) {
                setState(() {
                  _value1 = value;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              child: RangeSlider(
                min: 0.0,
                max: 100.0,
                values: _value,
                divisions: 5,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 100,
              child: SfRangeSlider(
                min: 0.0,
                max: 100.0,
                values: _syncValue,
                interval: 20,
                showLabels: true,
                semanticFormatterCallback: (SfRangeValues values) {
                  return 'SfRangeValues ${values.start} ${values.end}';
                },
                onChanged: (SfRangeValues value) {
                  setState(() {
                    _syncValue = value;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
