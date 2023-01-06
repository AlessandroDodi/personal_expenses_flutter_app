import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({super.key});
  final Function buttonHandler;
  const NewTransaction(this.buttonHandler, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0.00;
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.buttonHandler(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom + 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Platform.isIOS
                    ? CupertinoTextField(
                        onSubmitted: (_) => _submitData(),
                        placeholder: "Title",
                        controller: _titleController,
                      )
                    : TextField(
                        decoration: const InputDecoration(labelText: "Title"),
                        controller: _titleController,
                        onSubmitted: (_) => _submitData(),
                      ),
                Container(
                  height: 8,
                ),
                Platform.isIOS
                    ? CupertinoTextField(
                        onSubmitted: (_) => _submitData(),
                        placeholder: "Amount",
                        controller: _amountController,
                      )
                    : TextField(
                        decoration: const InputDecoration(labelText: "Amount"),
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        onSubmitted: (_) => _submitData(),
                      ),
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(_selectedDate == null
                            ? 'No date chosen!'
                            : 'Picked date: ${DateFormat.yMd().format(_selectedDate!).toString()}'),
                      ),
                      Platform.isIOS
                          ? CupertinoButton(
                              onPressed: _presentDatePicker,
                              child: const Text('Choose date'))
                          : ElevatedButton(
                              onPressed: _presentDatePicker,
                              child: const Text('Choose date'),
                            ),
                    ],
                  ),
                ),
                Platform.isIOS
                    ? CupertinoButton(
                        child: const Text('Add transaction'),
                        onPressed: () => _submitData())
                    : ElevatedButton(
                        onPressed: () => _submitData(),
                        child: const Text('Add transaction'))
              ],
            ),
          )),
    );
  }
}
