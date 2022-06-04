import 'package:despesas_pessoais/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, this.recentTransactions}) : super(key: key);

  final List<Transaction>? recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;
        for (var i = 0; i < recentTransactions!.length; i++) {
          bool sameDay = recentTransactions![i].date!.day == weekDay.day;
          bool sameMonth = recentTransactions![i].date!.month == weekDay.month;
          bool sameYear = recentTransactions![i].date!.year == weekDay.year;

          if (sameDay && sameMonth && sameYear) {
            totalSum += recentTransactions![i].value!;
          }
        }

        debugPrint(DateFormat.E().format(weekDay)[0]);
        debugPrint(totalSum.toString());

        return {
          'day': DateFormat.E().format(weekDay)[0],
          'value': totalSum,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return Text(
            '${tr['day']}: ${tr['value']} ',
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          );
        }).toList(),
      ),
    );
  }
}
