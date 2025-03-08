import 'package:expense_tracker/components/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //text controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //add new expense
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          //expense name
          TextField(
            decoration: InputDecoration(
              labelText: 'Expense Name',
            ),
            controller: newExpenseNameController
          ),

          //expense amount
          TextField(
            decoration: InputDecoration(
              labelText: 'Expense Amount',
            ),
            controller: newExpenseAmountController
          ),
        ],),
        actions: [
          //save button
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
            ),

            
          //cancel button
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
            ),
        ]
      ));
  }

  //save button
  void save() {
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now(),
    );

    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    //removes dialog
    Navigator.pop(context);
    clear();
  }

  //cancel button
  void cancel() {

  }

  //clear all data
  void clear() {
    newExpenseAmountController.clear();
    newExpenseNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    //rebuilds the widget depending on data
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: Icon(Icons.add),
          ),
        body: ListView.builder(
          itemCount: value.getAllExpenseList().length,
          itemBuilder: (context, index) => ExpenseTile(
            name: value.getAllExpenseList()[index].name,
            dateTime: value.getAllExpenseList()[index].dateTime,
            amount: value.getAllExpenseList()[index].amount,
          ),
        )
      ),
    );
  }
}