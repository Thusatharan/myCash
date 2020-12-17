import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycash/showExpenses.dart';
import './createRecord.dart';
import './showExpenses.dart';
import './expenses.dart';
import './chart_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
        cardColor: Colors.white,
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
    // Expenses(
    //   id: 'E1',
    //   title: 'Online Course',
    //   amount: 11.99,
    //   date: DateTime.now(),
    // ),
    // Expenses(
    //   id: 'E2',
    //   title: 'New Headset',
    //   amount: 14.49,
    //   date: DateTime.now(),
    // ),
  ];

  List<Expenses> get latestExpenses {
    return expenselist.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewRecord(
      String newTitle, double newAmount, DateTime selectedDateTime) {
    final newRecord = Expenses(
      title: newTitle,
      amount: newAmount,
      date: selectedDateTime,
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

  void deleteRecord(String id) {
    setState(() {
      expenselist.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Center(child: Text('MyCash')),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _showBottomSheet(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(latestExpenses),
            ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: ShowExpenses(expenselist, deleteRecord)),
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
