import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';
import 'expenses.dart';

class Chart extends StatelessWidget {
  final List<Expenses> recentExpenses;

  Chart(this.recentExpenses);

  List<Map<String, Object>> get groupedExpenses {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      double totalExpenses = 0;
      for (var i = 0; i < recentExpenses.length; i++) {
        if (recentExpenses[i].date.day == weekday.day &&
            recentExpenses[i].date.month == weekday.month &&
            recentExpenses[i].date.year == weekday.year) {
          totalExpenses += recentExpenses[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalExpenses
      };
    }).reversed.toList();
  }

  double get maxExpenses {
    return groupedExpenses.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedExpenses.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  maxExpenses == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxExpenses),
            );
          }).toList(),
        ),
      ),
    );
  }
}
