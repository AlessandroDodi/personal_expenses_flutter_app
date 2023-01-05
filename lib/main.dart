// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'GothicA1'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New phone', amount: 1999.99, date: DateTime.now())
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

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: TransactionList(_userTransaction),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
