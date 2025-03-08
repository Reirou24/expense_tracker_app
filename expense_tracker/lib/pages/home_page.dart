import 'package:expense_tracker/components/expense_summary.dart';
import 'package:expense_tracker/components/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:expense_tracker/utilities/dimensions.dart';
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
  final newExpensePesoController = TextEditingController();
  final newExpenseCentsController = TextEditingController();

  //prepare data on startup
  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  } 

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
          Row(children: [
            Expanded(
              child: 
              TextField(
                controller: newExpensePesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '₱',
                )
              ),
            ),

            Expanded(
              child: TextField(
                controller: newExpenseCentsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '¢',
                )
              ),
            ),
          ],)
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

  //delete expense
  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  //save button
  void save() {

    if (
      newExpenseNameController.text.isNotEmpty && 
      newExpensePesoController.text.isNotEmpty && 
      newExpenseCentsController.text.isNotEmpty) {
      
      String amount = "${newExpensePesoController.text}.${newExpenseCentsController.text}";

      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: amount,
        dateTime: DateTime.now(),
      );

      Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    }
    
    //removes dialog
    Navigator.pop(context);
    clear();
  }

  //cancel button
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear all data
  void clear() {
    newExpensePesoController.clear();
    newExpenseCentsController.clear();
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
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          ),
        body: ListView(children: [
          //weekly
          ExpenseSummary(
            startofWeek: value.startofWeekDate()),

          SizedBox(height: Dimensions.height20),

          //expense list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.getAllExpenseList().length,
            itemBuilder: (context, index) => ExpenseTile(
              name: value.getAllExpenseList()[index].name,
              dateTime: value.getAllExpenseList()[index].dateTime,
              amount: value.getAllExpenseList()[index].amount,
              deleteTapped: (p0) =>
              deleteExpense(value.getAllExpenseList()[index]),
            ),
          )
        ],)
      ),
    );
  }
}