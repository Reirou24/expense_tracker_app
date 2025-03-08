import 'package:expense_tracker/bar%20graph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startofWeek;

  const ExpenseSummary({super.key, required this.startofWeek});

  @override
  Widget build(BuildContext context) {
    //get yyyymmdd
    String sunday = convertDateTimeToString(startofWeek.add(Duration(days: 0)));
    String monday = convertDateTimeToString(startofWeek.add(Duration(days: 1)));
    String tuesday = convertDateTimeToString(startofWeek.add(Duration(days: 2)));
    String wednesday = convertDateTimeToString(startofWeek.add(Duration(days: 3)));
    String thursday = convertDateTimeToString(startofWeek.add(Duration(days: 4)));
    String friday = convertDateTimeToString(startofWeek.add(Duration(days: 5)));
    String saturday = convertDateTimeToString(startofWeek.add(Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: 100, 
          sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0, 
          monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0, 
          tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0, 
          wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0, 
          thuAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0, 
          friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0, 
          satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
        ),
      )
    );
  }
}