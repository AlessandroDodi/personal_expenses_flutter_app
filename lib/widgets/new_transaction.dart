import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({super.key});
  final Function buttonHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
              ),
              ElevatedButton(
                  onPressed: () {
                    buttonHandler(
                        titleController.text.toString(),
                        double.tryParse(amountController.text.toString()) ??
                            0.0);
                  },
                  child: Text('Add transaction'))
            ],
          ),
        ));
  }
}
