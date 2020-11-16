import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './expenses.dart';

class ShowExpenses extends StatelessWidget {

  final List<Expenses> userExpenses;

  ShowExpenses(this.userExpenses);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (itm, index) {
            return Card(
              color: Theme.of(context).cardColor,
              elevation: 4,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '${userExpenses[index].amount.toStringAsFixed(2)} Rs',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[800],
                          fontSize: 22),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        userExpenses[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(userExpenses[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ));
        },
        itemCount: userExpenses.length,
      ),
    );
  }
}
