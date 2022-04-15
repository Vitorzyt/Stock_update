import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'line_titles.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget(this.firstPoint, this.secondPoint, this.thirdPoint,
      this.fourthPoint, this.fifthPoint);

  late final double firstPoint;
  late final double secondPoint;
  late final double thirdPoint;
  late final double fourthPoint;
  late final double fifthPoint;

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 4,
          //minY: (fifthPoint + fifthPoint * 0.02),
          //maxY: (fifthPoint - fifthPoint * 0.02),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                //interval: 1,
                reservedSize: 45,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, fifthPoint),
                FlSpot(1, fourthPoint),
                FlSpot(2, thirdPoint),
                FlSpot(3, secondPoint),
                FlSpot(4, firstPoint),
              ],
              isCurved: true,
              color: Color.fromARGB(255, 63, 3, 244),
              barWidth: 5,

              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                  show: true,
                  color: Color.fromARGB(255, 63, 3, 244).withOpacity(0.3)),
            ),
          ],
        ),
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      //color: Color(0xff68737d),
      // fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('16:00', style: style);
        break;
      case 1:
        text = const Text('17:00', style: style);
        break;
      case 2:
        text = const Text('18:00', style: style);
        break;
      case 3:
        text = const Text('19:00', style: style);
        break;
      case 4:
        text = const Text('20:00', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      //color: Color(0xff68737d),
      // fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('', style: style);
        break;
      case 1:
        text = const Text('', style: style);
        break;
      case 2:
        text = const Text('', style: style);
        break;
      case 3:
        text = const Text('', style: style);
        break;
      case 4:
        text = const Text('', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(right: 8.0));
  }
}
