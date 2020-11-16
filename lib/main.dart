import 'package:flutter/material.dart';
import 'package:mycash/showExpenses.dart';
import './createRecord.dart';
import './showExpenses.dart';
import './expenses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCash',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        cardColor: Colors.teal[50],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _addNewRecord(String newTitle, double newAmount) {
    final newRecord = Expenses(
      title: newTitle,
      amount: newAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      expenselist.add(newRecord);
    });
  }

  void _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: CreateRecord(_addNewRecord),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MyCash')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showBottomSheet(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Expenses Chart'),
                elevation: 5,
              ),
            ),
            ShowExpenses(expenselist),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showBottomSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
