import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// ignore: must_be_immutable
class DefaultRangeSelectorPage extends StatefulWidget {
  DefaultRangeSelectorPage();

  @override
  _DefaultRangeSelectorPageState createState() =>
      _DefaultRangeSelectorPageState();
}

class _DefaultRangeSelectorPageState extends State<DefaultRangeSelectorPage> {
  _DefaultRangeSelectorPageState();

  final DateTime min = DateTime(2002, 01, 01), max = DateTime(2011, 01, 01);
  List<Data> chartData;
  RangeController rangeController;
  LinearGradient gradientColors;

  @override
  void initState() {
    super.initState();
    chartData = <Data>[
      Data(x: DateTime(2002, 01, 01), y: 2.2),
      Data(x: DateTime(2003, 01, 01), y: 3.4),
      Data(x: DateTime(2004, 01, 01), y: 2.8),
      Data(x: DateTime(2005, 01, 01), y: 1.6),
      Data(x: DateTime(2006, 01, 01), y: 2.3),
      Data(x: DateTime(2007, 01, 01), y: 2.5),
      Data(x: DateTime(2008, 01, 01), y: 2.9),
      Data(x: DateTime(2009, 01, 01), y: 3.8),
      Data(x: DateTime(2010, 01, 01), y: 1.4),
      Data(x: DateTime(2011, 01, 01), y: 3.1),
    ];
    rangeController = RangeController(
      start: DateTime(2005, 01, 01),
      end: DateTime(2008, 01, 01),
    );
    gradientColors = const LinearGradient(colors: <Color>[
      Color.fromRGBO(255, 125, 30, 0.4),
      Color.fromRGBO(255, 125, 30, 1)
    ], stops: <double>[
      0.0,
      0.5
    ]);
  }

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
          initialValues: _syncValues,
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  SfRangeSelectorTheme get activeRangeSelector => SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(),
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
          enableTooltip: true,
          dragMode: SliderDragMode.both,
          onChanged: (values) {
            // setState(() {
            //   _dateTimeValues = values;
            // });
          },
        ),
      );

  SfRangeSelectorTheme get activeRangeSelector2 => SfRangeSelectorTheme(
        data: SfRangeSelectorThemeData(),
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
          enableTooltip: true,
          dragMode: SliderDragMode.betweenThumbs,
          onChanged: (values) {
            // setState(() {
            //   _dateTimeValues = values;
            // });
          },
        ),
      );

  SfRangeSelectorTheme get defaultRangeSelector2 => SfRangeSelectorTheme(
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
          initialValues: _syncValues,
          onChanged: (value) {
            setState(() {
              _syncValues = value;
            });
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider Demo'),
        ),
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Text('Default Range selector'),
              SizedBox(
                height: 30,
              ),
              defaultRangeSelector,
              SizedBox(
                height: 30,
              ),
              Text('Range selector with enable lock range'),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                    child: SfRangeSelectorTheme(
                      data: SfRangeSelectorThemeData(
                          brightness: themeData.brightness,
                          labelOffset: const Offset(0, 0),
                          activeLabelStyle: TextStyle(
                              fontSize: 10,
                              color: themeData.textTheme.bodyText1.color
                                  .withOpacity(0.87)),
                          inactiveLabelStyle: TextStyle(
                              fontSize: 10,
                              color: themeData.textTheme.bodyText1.color
                                  .withOpacity(0.87))),
                      child: SfRangeSelector(
                        min: min,
                        max: max,
                        labelPlacement: LabelPlacement.betweenTicks,
                        interval: (kIsWeb && mediaQueryData.size.width <= 1000)
                            ? 2
                            : 1,
                        controller: rangeController,
                        dateFormat: DateFormat.y(),
                        showTicks: true,
                        showLabels: true,
                        dragMode: SliderDragMode.both,
                        enableTooltip: true,
                        tooltipTextFormatterCallback:
                            (dynamic actualLabel, String formattedText) {
                          return DateFormat.yMMMd()
                              .format(actualLabel)
                              .toString();
                        },
                        onChanged: (SfRangeValues values) {
                          setState(() {});
                        },
                        child: Container(
                          child: SfCartesianChart(
                            margin: const EdgeInsets.all(0),
                            primaryXAxis: DateTimeAxis(
                              minimum: min,
                              maximum: max,
                              isVisible: false,
                            ),
                            primaryYAxis:
                                NumericAxis(isVisible: false, maximum: 4),
                            plotAreaBorderWidth: 0,
                            series: <SplineAreaSeries<Data, DateTime>>[
                              SplineAreaSeries<Data, DateTime>(
                                  dataSource: chartData,
                                  xValueMapper: (Data sales, _) => sales.x,
                                  yValueMapper: (Data sales, _) => sales.y,
                                  gradient: gradientColors,
                                  animationDuration: 0)
                            ],
                          ),
                          width: mediaQueryData.orientation ==
                                  Orientation.landscape
                              ? kIsWeb
                                  ? mediaQueryData.size.width * 0.6
                                  : mediaQueryData.size.width
                              : mediaQueryData.size.width,
                          height:
                              mediaQueryData.orientation == Orientation.portrait
                                  ? mediaQueryData.size.height * 0.45
                                  : kIsWeb
                                      ? mediaQueryData.size.height * 0.38
                                      : mediaQueryData.size.height * 0.4,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Text('Range selector with enable lock thumb drag'),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                    child: SfRangeSelectorTheme(
                      data: SfRangeSelectorThemeData(
                          brightness: themeData.brightness,
                          labelOffset: const Offset(0, 0),
                          activeLabelStyle: TextStyle(
                              fontSize: 10,
                              color: themeData.textTheme.bodyText1.color
                                  .withOpacity(0.87)),
                          inactiveLabelStyle: TextStyle(
                              fontSize: 10,
                              color: themeData.textTheme.bodyText1.color
                                  .withOpacity(0.87))),
                      child: SfRangeSelector(
                        min: min,
                        max: max,
                        labelPlacement: LabelPlacement.betweenTicks,
                        interval: (kIsWeb && mediaQueryData.size.width <= 1000)
                            ? 2
                            : 1,
                        controller: rangeController,
                        dateFormat: DateFormat.y(),
                        showTicks: true,
                        showLabels: true,
                        dragMode: SliderDragMode.betweenThumbs,
                        enableTooltip: true,
                        tooltipTextFormatterCallback:
                            (dynamic actualLabel, String formattedText) {
                          return DateFormat.yMMMd()
                              .format(actualLabel)
                              .toString();
                        },
                        onChanged: (SfRangeValues values) {
                          setState(() {});
                        },
                        child: Container(
                          child: SfCartesianChart(
                            margin: const EdgeInsets.all(0),
                            primaryXAxis: DateTimeAxis(
                              minimum: min,
                              maximum: max,
                              isVisible: false,
                            ),
                            primaryYAxis:
                                NumericAxis(isVisible: false, maximum: 4),
                            plotAreaBorderWidth: 0,
                            series: <SplineAreaSeries<Data, DateTime>>[
                              SplineAreaSeries<Data, DateTime>(
                                  dataSource: chartData,
                                  xValueMapper: (Data sales, _) => sales.x,
                                  yValueMapper: (Data sales, _) => sales.y,
                                  gradient: gradientColors,
                                  animationDuration: 0)
                            ],
                          ),
                          width: mediaQueryData.orientation ==
                                  Orientation.landscape
                              ? kIsWeb
                                  ? mediaQueryData.size.width * 0.6
                                  : mediaQueryData.size.width
                              : mediaQueryData.size.width,
                          height:
                              mediaQueryData.orientation == Orientation.portrait
                                  ? mediaQueryData.size.height * 0.45
                                  : kIsWeb
                                      ? mediaQueryData.size.height * 0.38
                                      : mediaQueryData.size.height * 0.4,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class Data {
  Data({this.x, this.y});
  final DateTime x;
  final double y;
}
