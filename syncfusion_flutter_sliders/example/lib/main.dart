import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_core/theme.dart';
void main() {
  return runApp(MaterialApp(title: 'slider and container', home: Sliders()));
}
class Sliders extends StatefulWidget {
  State<StatefulWidget> createState() => SlidersState();
}
// class SlidersState extends State<Sliders> {
//   double _value = 5.0;
//   //DateTime _value = DateTime(2002, 01, 01);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: Text('slider')),
//             body: Container(
//               //color:Colors.blueAccent,
//               child: SfSliderTheme(
//                 data: SfSliderThemeData(
//                     thumbRadius: 10,
//                     thumbColor: Colors.brown,
//                     overlayRadius: 30,
//                     activeTrackColor: Colors.red,
//                     inactiveTrackColor: Colors.red[100],
//                     activeTrackHeight: 8,
//                     inactiveTrackHeight: 15,
//                     trackCornerRadius: 4,
//                     activeTickColor: Colors.red,
//                     inactiveTickColor: Colors.red[200],
//                     activeMinorTickColor: Colors.blueAccent,
//                     inactiveMinorTickColor: Colors.red[200],
//                     tickSize: Size(3.0, 12.0),
//                     minorTickSize: Size(3.0, 8.0),
//                     //tickOffset: Offset(0.0, 10.0),
//                     activeDivisorRadius: 5,
//                     tooltipBackgroundColor: Colors.greenAccent,
//                     inactiveDivisorRadius: 8),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Container(width: 300.0, height: 50.0),
//                       Container(
//                         //color: Colors.yellow,
//                         child: SfSlider(
//                           direction: Axis.vertical,
//                           min: 0.0,
//                           max: 10.0,
//                           showLabels: true,
//                           interval: 2,
//                           showTicks: true,
//                           enableTooltip: true,
//                           stepSize: 1,
//                           minorTicksPerInterval: 1,
//                           labelPlacement: LabelPlacement.onTicks,
//                           showDivisors: true,
//                           // dateFormat: DateFormat.y(),
//                           // dateIntervalType: DateIntervalType.years,
//                           // min: DateTime(2000, 01, 01, 00),
//                           // max: DateTime(2010, 12, 31, 24),
//                           //tooltipShape: SfPaddleTooltipShape(),
//                           //  thumbIcon:
//                           //      Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 20.0),
//                           // labelFormatterCallback: (dynamic actualValue, String formattedText) {
//                           //   return actualValue == 10 ? '\$ $formattedText+' : '\$ $formattedText';
//                           // },
//                           value: _value,
//                           onChanged: (dynamic newValue) {
//                             setState(() {
//                               _value = newValue;
//                             });
//                           },
//                         ),
//                       ),
//                       // Container(width: 300.0, height: 125.0)
//                     ],
//                   ),
//                 ),
//               ),
//             )));
//   }
// }
class SlidersState extends State<Sliders> {
  SfRangeValues _values = SfRangeValues(2.0, 6.0);
  //SfRangeValues _values =SfRangeValues(DateTime(2002, 01, 01), DateTime(2003, 01, 01));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('slider')),
            body: Container(
              child: SfRangeSliderTheme(
                data: SfRangeSliderThemeData(
                    thumbRadius: 10,
                    thumbColor: Colors.brown,
                    overlayRadius: 30,
                    activeTrackColor: Colors.red,
                    inactiveTrackColor: Colors.red[100],
                    activeTrackHeight: 8,
                    inactiveTrackHeight: 15,
                    trackCornerRadius: 4,
                    activeTickColor: Colors.red,
                    inactiveTickColor: Colors.red[200],
                    activeMinorTickColor: Colors.blueAccent,
                    inactiveMinorTickColor: Colors.red[200],
                    tickSize: Size(3.0, 12.0),
                    minorTickSize: Size(3.0, 8.0),
                    //tickOffset: Offset(0.0, 10.0),
                    activeDivisorRadius: 5,
                    tooltipBackgroundColor: Colors.greenAccent,
                    inactiveDivisorRadius: 8),
                child: Center(
                  child: Column(
                    children: [
                      Container(width: 300.0, height: 50.0),
                      Container(
                        color: Colors.yellow,
                        child: SfRangeSlider(
                         // direction: Axis.vertical,
                          min: 0.0,
                          max: 10.0,
                          // min: DateTime(2000, 01, 01, 00),
                          // max: DateTime(2004, 12, 31, 24),
                          showLabels: true,
                          showTicks: true,
                          showTooltip: true,
                          stepSize: 1,
                          minorTicksPerInterval: 1,
                          labelPlacement: LabelPlacement.onTicks,
                          showDivisors: true,
                          interval: 2,
                          // dateFormat: DateFormat.y(),
                          // dateIntervalType: DateIntervalType.years,
                          //tooltipShape: SfPaddleTooltipShape(),
                          // thumbIcon:
                          //     Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 20.0),
                          // labelFormatterCallback: (dynamic actualValue, String formattedText) {
                          //   return actualValue == 10 ? '\$ $formattedText+' : '\$ $formattedText';
                          // },
                          values: _values,
                          onChanged: (SfRangeValues newValues) {
                            setState(() {
                              _values = newValues;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}