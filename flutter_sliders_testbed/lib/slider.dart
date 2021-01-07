import 'package:flutter/material.dart';
import 'slider/ColorPage.dart';
import 'slider/DefaultPage.dart';
import 'slider/DefaultPageWithLabelsInterval.dart';
import 'slider/IntervalTypePage.dart';
import 'slider/LabelFormat.dart';
import 'slider/MinMaxPage.dart';
import 'slider/OffsetPage.dart';
import 'slider/SizePage.dart';
import 'slider/Tooltip.dart';
import 'slider/LabelPlacementPage.dart';
import 'slider/RTL.dart';
import 'slider/thumb_icon.dart';
import 'slider/DarkTheme.dart';
import 'slider_accessibility.dart';
import 'slider/volume_adjust.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  List<String> getListViewItemsSource() {
    return <String>[
      'Default',
      'DefaultWithLabelsInterval',
      'MinMax',
      'Color',
      'Size',
      'Offset',
      'LabelPlacement',
      'Interval Type',
      'Label Format',
      'Tooltip',
      'RTL',
      'Dark theme',
      'ThumbIcon',
      'Accessibility',
      'Volume adjust'
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
                    if (index == 0) return SliderDefaultPage();
                    if (index == 1)
                      return SliderDefaultWithLabelsIntervalPage();
                    if (index == 2) return SliderMinMaxPage();
                    if (index == 3) return SliderColorPage();
                    if (index == 4) return SliderSizePage();
                    if (index == 5) return SliderOffsetPage();
                    if (index == 6) return SliderLabelPlacementPage();
                    if (index == 7) return SliderDateTimeIntervalPage();
                    if (index == 8) return SliderLabelFormatPage();
                    if (index == 9) return SliderTooltipPage();
                    if (index == 10) return SliderRTLPage();
                    if (index == 11) return SliderDarkThemePage();
                    if (index == 12) return SliderThumbIconPage();
                    if (index == 13) return SliderAccessibilityPage();
                    if (index == 14) return SliderVolumeAdjustPage();
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
