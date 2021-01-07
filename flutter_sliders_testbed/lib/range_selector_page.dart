import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_core/theme.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSelectorPage extends StatefulWidget {
  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage>
    with TickerProviderStateMixin {
  double sizeBoxHeight = 20;

  double numericMin = 50.0;
  double numericMax = 100.0;
  SfRangeValues _numericValues = SfRangeValues(55.0, 66.0);

  RangeValues _values = RangeValues(60.0, 70.0);

  DateTime dateTimeMin = DateTime(2000, 01, 01);
  DateTime dateTimeMax = DateTime(2005, 12, 31, 24);
  SfRangeValues _dateTimeValues =
      SfRangeValues(DateTime(2000, 01, 01), DateTime(2000, 12, 31, 24));

  SfRangeSelectorTheme get numericRangeSlector1 => SfRangeSelectorTheme(
        child: SfRangeSelector(
          min: numericMin,
          max: numericMax,
          // interval: 10,
          initialValues: _numericValues,
          // controller: _numericController,
          interval: 10,
          // showTicks: true,
          enableTooltip: true,
          showLabels: true,
          // valueSelectionMode: RangeSelectionMode.discrete,
          // labelFormatterCallback: (actual, formatted) {
          //   return formatted + ' %';
          // },
          // onChanged: (values) {
          // setState(() {
          //   _numericValues = values;
          // });
          // },
          child: Container(
              // height: 0,
              ),
        ),
        data: SfRangeSelectorThemeData(
          // labelOffset: Offset(0, 15),
          // tickSize: Size(1, 25),
          activeLabelStyle: TextStyle(fontSize: 25, color: Colors.red),
        ),
      );

  SfRangeSelector get numericRangeSlector2 => SfRangeSelector(
        min: numericMin,
        max: numericMax,
        initialValues: _numericValues,
        controller: _numericController,
        interval: 10,
        showTicks: true,
        showLabels: true,
        onChanged: (values) {},
        child: Container(
          height: 0,
        ),
      );

  SfRangeSelector get dateTimeRangeSlector1 => SfRangeSelector(
        child: Container(
          height: 100,
        ),
        min: dateTimeMin,
        max: dateTimeMax,
        enabled: true,
        initialValues: _dateTimeValues,
        interval: 1,
        controller: _dateTimeController,
        dateIntervalType: DateIntervalType.years,
        dateFormat: DateFormat.y(),
        showTicks: true,
        showLabels: true,
        onChanged: (values) {
          // setState(() {
          //   _dateTimeValues = values;
          // });
        },
      );

  SfRangeSelector get dateTimeRangeSlector2 => SfRangeSelector(
        min: dateTimeMin,
        max: dateTimeMax,
        initialValues: _dateTimeValues,
        interval: 1,
        controller: _dateTimeController,
        dateIntervalType: DateIntervalType.years,
        dateFormat: DateFormat.y(),
        labelPlacement: LabelPlacement.betweenTicks,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        onChanged: (values) {},
        tooltipTextFormatterCallback: (actual, formatted) {
          return DateFormat.yMd().format(actual).toString() +
              ' , ' +
              DateFormat.H().format(actual).toString();
        },
        child: Container(
          height: 0,
        ),
      );

  RangeSlider get frameworkRangeSlider => RangeSlider(
        min: numericMin,
        max: numericMax,
        values: _values,
        // divisions: 5,
        labels: RangeLabels(_values.start.toString(), _values.end.toString()),
        onChanged: (values) {
          setState(() {
            _values = values;
          });
        },
      );

  Widget _getAlignedTextWidget(String text,
      {double fontSize = 14, FontWeight fontWeight = FontWeight.normal}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
        padding: EdgeInsets.only(left: 10),
      ),
    );
  }

  Widget get sizedBox => SizedBox(height: sizeBoxHeight);

  // NumericAxis get primaryAxis => NumericAxis(
  // labelStyle: ChartTextStyle(fontSize: 0),
  // axisLine: AxisLine(width: 0),
  // majorTickLines: MajorTickLines(size: 0, width: 0),
  // isVisible: false);

  // SfCartesianChart get lineChart => SfCartesianChart(
  //       primaryXAxis: primaryAxis,
  //       primaryYAxis: primaryAxis,
  //       plotAreaBorderColor: Theme.of(context).primaryColor.withOpacity(0.24),
  //       margin: EdgeInsets.all(0),
  //       series: <ChartSeries>[
  //         LineSeries<Data, int>(
  //             animationDuration: 0,
  //             dataSource: dataSource,
  //             xValueMapper: (Data data, _) => data.month,
  //             yValueMapper: (Data data, _) => data.unit)
  //       ],
  //     );

  // List<Data> get dataSource => [
  //       Data(1, 15),
  //       Data(2, 38),
  //       Data(3, 18),
  //       Data(4, 60),
  //       Data(5, 40),
  //     ];

  RangeController _numericController;

  RangeController _dateTimeController;

  @override
  void initState() {
    super.initState();
    _numericController =
        RangeController(start: _numericValues.start, end: _numericValues.end);

    _dateTimeController =
        RangeController(start: _dateTimeValues.start, end: _dateTimeValues.end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Range selector page'),
      ),
      body:
          // Container(
          //   child: numericRangeSlector2,
          // )
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getAlignedTextWidget('Framework range slider'),
          sizedBox,
          frameworkRangeSlider,
          sizedBox,
          _getAlignedTextWidget('Sync numeric range slider'),
          sizedBox,
          numericRangeSlector1,
          sizedBox,
          numericRangeSlector2,
          sizedBox,
          _getAlignedTextWidget('Sync date time range slider'),
          sizedBox,
          dateTimeRangeSlector1,
          sizedBox,
          dateTimeRangeSlector2
        ],
      ),
    );
  }
}

class Data {
  Data(this.month, this.unit);
  final int month;
  final double unit;
}
