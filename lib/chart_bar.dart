import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double recentExpense;
  final double recentPctExpense;

  ChartBar(this.label, this.recentExpense, this.recentPctExpense);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                  child: Text('${recentExpense.toStringAsFixed(0)} Rs'))),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.7,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal, width: 1.0),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: recentPctExpense,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.1,
            child: Text(label),
          ),
        ],
      );
    });
  }
}
