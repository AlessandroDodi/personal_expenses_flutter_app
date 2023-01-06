import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  //const Chart({super.key});
  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions, {super.key});
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;
      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get maxSpending {
    return groupedTransactionValues.fold(
      0.0,
      (previousValue, element) =>
          (previousValue + (element['amount'] as double)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              data['day'].toString(),
              (data['amount'] as double),
              maxSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / maxSpending,
            ),
          );
        }).toList(),
      ),
    );
  }
}
