import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(child: Text('expenses'), width: double.infinity),
            elevation: 5,
          ),
          Column(
            children: transactions
                .map((tx) => Card(
                        child: Row(children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            tx.amount.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat.yMMMd().format(tx.date)),
                        ],
                      )
                    ])))
                .toList(),
          )
        ],
      ),
    );
  }
}
