import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? SizedBox(
              height: 10,
              child: Image.asset('assets/images/No data-cuate.png',
                  fit: BoxFit.contain),
            )
          : ListView(
              children: transactions
                  .map((el) => TransactionItem(
                      key: ValueKey(el.id),
                      transaction: el,
                      deleteTx: deleteTx))
                  .toList(),
            ),
    );
  }
}
