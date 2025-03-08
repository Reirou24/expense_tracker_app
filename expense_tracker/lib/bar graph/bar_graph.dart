import 'package:expense_tracker/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {

  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  
  const MyBarGraph({super.key, required this.maxY, required this.sunAmount, required this.monAmount, required this.tueAmount, required this.wedAmount, required this.thuAmount, required this.friAmount, required this.satAmount});

  @override
  Widget build(BuildContext context) {

    //initialize the data
    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thuAmount: thuAmount,
      friAmount: friAmount,
      satAmount: satAmount,
    );

    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles)),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: myBarData.barData
        .map(
          (data) => BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
                color: Colors.grey[800],
                width: 25,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 100,
                  color: Colors.grey[300],
                )
              )
            ]))
          .toList(),
      )
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('Sun', style: style);
      break;
    case 1:
      text = Text('Mon', style: style);
      break;
    case 2:
      text = Text('Tue', style: style);
      break;
    case 3:
      text = Text('Wed', style: style);
      break;
    case 4:
      text = Text('Thu', style: style);
      break;
    case 5:
      text = Text('Fri', style: style);
      break;
    case 6:
      text = Text('Sat', style: style);
      break;
    default:
      text = Text('');
      break;
  }
  
    return text;
  }