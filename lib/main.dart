import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      amount: 14.49,
      date: DateTime.now(),
    ),
  ];

  final titleController = TextEditingController();
  final amountController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myCash'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Expenses Chart'),
              elevation: 5,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                  ),
                  FlatButton(
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text('Add Record'),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: expenselist.map((expense) {
              return Card(
                  color: Colors.teal[50],
                  elevation: 4,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.teal,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '\$${expense.amount}',
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
                            expense.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(expense.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
