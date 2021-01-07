import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

double lowToMediumTransition;
double mediumToHighTransition;

class SliderVolumeAdjustPage extends StatefulWidget {
  @override
  _SliderVolumeAdjustPageState createState() => _SliderVolumeAdjustPageState();
}

class _SliderVolumeAdjustPageState extends State<SliderVolumeAdjustPage> {
  double _value = 0.5;
  double _min = 0.0;
  double _max = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider volume adjust'),
        ),
        body: SfSliderTheme(
          data: SfRangeSliderThemeData(overlayColor: Colors.transparent),
          child: SfSlider(
            min: _min,
            max: _max,
            value: _value,
            interval: 0.1,
            showLabels: true,
            showTicks: true,
            trackShape: _SfTrackShape(_min, _max),
            thumbShape: _SfThumbShape(_min, _max),
            onChanged: (dynamic value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ));
  }
}

class _SfTrackShape extends SfTrackShape {
  double min;
  double max;
  double trackIntermediatePos;

  _SfTrackShape(dynamic min, dynamic max) {
    this.min = min.runtimeType == DateTime
        ? min.millisecondsSinceEpoch.toDouble()
        : min;
    this.max = max.runtimeType == DateTime
        ? max.millisecondsSinceEpoch.toDouble()
        : max;
  }

  void paint(
    PaintingContext context,
    Offset offset,
    Offset thumbCenter,
    Offset startThumbCenter,
    Offset endThumbCenter, {
    RenderBox parentBox,
    themeData,
    SfRangeValues currentValues,
    dynamic currentValue,
    Animation<double> enableAnimation,
    Paint inactivePaint,
    Paint activePaint,
    TextDirection textDirection,
  }) {
    Rect trackRect = getPreferredRect(parentBox, themeData, offset);
    final double actualValue = currentValues.runtimeType == DateTime
        ? currentValue.millisecondsSinceEpoch.toDouble()
        : currentValue;
    final double actualValueInPercent =
        ((actualValue - min) * 100) / (max - min);
    trackIntermediatePos = _getTrackIntermediatePosition(trackRect);

    // low volume track.
    Paint trackPaint = Paint();
    trackPaint.color = actualValueInPercent <= 80.0 ? Colors.green : Colors.red;
    Rect lowVolumeRect = Rect.fromLTRB(
        trackRect.left, trackRect.top, trackIntermediatePos, trackRect.bottom);
    context.canvas.drawRect(lowVolumeRect, trackPaint);

    // high volume track.
    trackPaint.color = Colors.red;
    Rect highVolumeRect = Rect.fromLTRB(trackIntermediatePos, trackRect.top,
        trackRect.width + trackRect.left, trackRect.bottom);
    context.canvas.drawRect(highVolumeRect, trackPaint);
  }

  double _getTrackIntermediatePosition(Rect trackRect) {
    final double actualValue = ((80 * (max - min)) + min) / 100;
    return (((actualValue - min) / (max - min)) * trackRect.width) +
        trackRect.left;
  }
}

class _SfThumbShape extends SfThumbShape {
  double min;
  double max;
  _SfThumbShape(dynamic min, dynamic max) {
    this.min = min.runtimeType == DateTime
        ? min.millisecondsSinceEpoch.toDouble()
        : min;
    this.max = max.runtimeType == DateTime
        ? max.millisecondsSinceEpoch.toDouble()
        : max;
  }

  void paint(PaintingContext context, Offset center,
      {RenderBox parentBox,
      RenderBox child,
      themeData,
      SfRangeValues currentValues,
      dynamic currentValue,
      Paint paint,
      Animation<double> enableAnimation,
      TextDirection textDirection,
      SfThumb thumb}) {
    final double actualValue = currentValues.runtimeType == DateTime
        ? currentValue.millisecondsSinceEpoch.toDouble()
        : currentValue;

    final double actualValueInPercent =
        ((actualValue - min) * 100) / (max - min);

    paint = Paint();
    paint.color = actualValueInPercent <= 80 ? Colors.green : Colors.red;

    super.paint(context, center,
        parentBox: parentBox,
        themeData: themeData,
        currentValue: currentValue,
        paint: paint,
        enableAnimation: enableAnimation,
        textDirection: textDirection);
  }
}
