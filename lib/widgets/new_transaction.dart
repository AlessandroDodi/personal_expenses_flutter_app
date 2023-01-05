import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({super.key});
  final Function buttonHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void submitData() {
    final enteredTItle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text) ?? 0.00;
    if (enteredTItle.isEmpty || enteredAmount <= 0) return;

    buttonHandler(enteredTItle, enteredAmount);
  }

  NewTransaction(this.buttonHandler);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              ElevatedButton(
                  onPressed: () => submitData(), child: Text('Add transaction'))
            ],
          ),
        ));
  }
}
