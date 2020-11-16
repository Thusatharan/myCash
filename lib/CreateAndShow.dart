import 'package:flutter/material.dart';
import './createRecord.dart';
import './showExpenses.dart';
import './expenses.dart';

class CreateAndShow extends StatefulWidget {
  @override
  _CreateAndShowState createState() => _CreateAndShowState();
}

class _CreateAndShowState extends State<CreateAndShow> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CreateRecord(_addNewRecord),
        ShowExpenses(expenselist),
      ],
    );
  }
}
