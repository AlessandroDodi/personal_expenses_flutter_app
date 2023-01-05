import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New phone', amount: 1999.99, date: DateTime.now())
  ];
  void _addNewTransaction(String title, double amount) {
    final nexTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransaction.add(nexTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransaction),
    ]);
  }
}
//quante ore
// da casa
// 30 giornate
//