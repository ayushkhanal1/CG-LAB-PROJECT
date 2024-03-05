import 'package:flutter/material.dart';
import 'package:tracker/models/exp.dart';
import 'package:tracker/expenses_list.dart';
import 'package:tracker/models/new_expense.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});
  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  final List<Exp> _registeredlist = [
    Exp(
        title: 'flutter course',
        amount: 0.1,
        date: DateTime.now(),
        category: Category.work),
    Exp(
        title: 'shopping',
        amount: 111,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void _onAddexpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onInsert: insertexpense),
    );
  }

  void insertexpense(Exp expense) {
    setState(
      () {
        _registeredlist.add(expense);
      },
    );
  }

  void deleteexpense(Exp expense) {
    final neededindex = _registeredlist.indexOf(expense);
    setState(() {
      _registeredlist.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registeredlist.insert(neededindex, expense);
            },);
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
     Widget maincontent =const Center(
      child: Text('NO EXPENSE CURRENTLY. ADD NOW'),
    );
    if (_registeredlist.isNotEmpty) {
      maincontent =
          ExpenseList(
            expensecolumn: _registeredlist,
            removeitem: deleteexpense,
          );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _onAddexpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: maincontent
          )
        ],
      ),
    );
  }
}
