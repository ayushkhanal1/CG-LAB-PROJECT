import 'package:flutter/material.dart';
//import 'package:tracker/expense.dart';
import 'package:tracker/models/exp.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense, super.key});
  final Exp expense;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  expense.amount.toStringAsFixed(2),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(
                      expense.getformatteddate(),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
