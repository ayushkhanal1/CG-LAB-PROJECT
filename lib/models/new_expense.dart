import 'package:flutter/material.dart';
import 'package:tracker/models/exp.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onInsert});
  final void Function(Exp expense) onInsert;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  Category _selectedcategory = Category.leisure;
  DateTime? _selecteddate;
  void submitdata() {
    final enteredamount = double.tryParse(_amountcontroller.text);
    if (_titlecontroller.text.trim().isEmpty ||
        enteredamount == null ||
        enteredamount < 0 ||
        _selecteddate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('INVALID INPUT!'),
          content: const Text(
              'Please make sure that you have entered correct data.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('OKAY'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onInsert(
      Exp(
          title: _titlecontroller.text,
          amount: enteredamount,
          date: _selecteddate!,
          category: _selectedcategory),
    );
   // print(_titlecontroller);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  void _datepicker() async {
    final pickeddate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );
    setState(() {
      _selecteddate = pickeddate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Expense Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountcontroller,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _datepicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                    Text(
                      _selecteddate == null
                          ? 'No Date Selected'
                          : formatter.format(_selecteddate!),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: _selectedcategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedcategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: submitdata,
                child: const Text('Save Expense'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
