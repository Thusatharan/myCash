import 'package:flutter/material.dart';
import './expenses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Expenses> expenselist = [
    Expenses(
      id: 'E1',
      title: 'Online Course',
      amount: 11.99,
      date: DateTime.now(),
    ),
    Expenses(
      id: 'E2',
      title: 'New Headset',
      amount: 4.49,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myCash'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Text('Expenses Chart'),
            elevation: 5,
          ),
          Column(children: expenselist.map((expense) {
            return Card(
              child: Text(expense.title),
            )
          }).toList(),
        ],
      ),
    );
  }
}
