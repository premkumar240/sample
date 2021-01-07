import 'package:flutter/material.dart';
import 'package:flutter_sliders_testbed/range_selector_RTL.dart';
import 'package:flutter_sliders_testbed/range_slider_RTL.dart';
import 'package:flutter_sliders_testbed/tooltip.dart';

import 'range_selector_page.dart';
import 'range_slider_page.dart';
import 'range_slider_thumbIcon.dart';
import 'range_selector_thumbIcon.dart';
import 'interval_selection_selector.dart';
import 'interval_selection_slider.dart';
import 'interval_selection_with_lock_range.dart';
import 'date_discrete_slider.dart';
import 'date_discrete_selector.dart';
import 'disable_thumb_drag.dart';
import 'slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> getListViewItemsSource() {
    return <String>[
      'Slider samples',
      'Range slider',
      'Range selector',
      'Thumb icon for range slider',
      'thumb icon for range selector',
      'Interval selection slider',
      'Interval selection selector',
      'Interval selection with lock range',
      'Date discrete slider',
      'Date discrete selector',
      'Lock thumb dragging',
      'Paddle tooltip',
      'Range slider RTL',
      'Range selector RTL',
    ];
  }

  @override
  Widget build(BuildContext context) {
    var itemsSource = getListViewItemsSource();
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Demo'),
      ),
      body: ListView.builder(
        itemCount: itemsSource.length,
        itemBuilder: (_, int index) {
          return ListTile(
            title: Text('${itemsSource[index]}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    if (index == 0) return SliderPage();
                    if (index == 1) return RangeSliderPage();
                    if (index == 2) return RangeSelectorPage();
                    if (index == 3) return SampleRangeSliderPage();
                    if (index == 4) return SampleRangeSelectorPage();
                    if (index == 5) return RangeSliderLabelClickPage();
                    if (index == 6) return RangeSelectorLabelClickPage();
                    if (index == 7) return RangeSelectorLockRangeWithInterval();
                    if (index == 8) return DateDiscreteRangeSliderPage();
                    if (index == 9) return DateDiscreteRangeSelectorPage();
                    if (index == 10) return DefaultRangeSelectorPage();
                    if (index == 11) return TooltipSliderPage();
                    if (index == 12) return RangeSliderRTLSample();
                    if (index == 13) return RangeSelectorRTLSample();
                    return null;
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
