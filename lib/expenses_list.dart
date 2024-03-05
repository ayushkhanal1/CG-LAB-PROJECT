import 'package:flutter/material.dart';
import 'package:tracker/expenses_item.dart';
import 'package:tracker/models/exp.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expensecolumn,required this.removeitem});
  final List<Exp> expensecolumn;
  final void Function(Exp expense) removeitem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensecolumn.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(
            expensecolumn[index],
          ),
          onDismissed: (direction) {
            removeitem(expensecolumn[index],);
          },
          child: ExpenseItem(
            expense: expensecolumn[index],
          ),
        );
      },
    );
  }
}
