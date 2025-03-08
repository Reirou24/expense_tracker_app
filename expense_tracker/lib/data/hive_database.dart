import 'package:expense_tracker/models/expense_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  // reference our box
  final _myBox = Hive.box('expenseDatabase');

  //write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpensesFormatted = [];

    for (var expense in allExpense) {
      //convert each item into a list of acceptable types in hive
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

  //save data to hive
    _myBox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  //read data
  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime
      );
      allExpenses.add(expense);
    }

    return allExpenses;
  }
}