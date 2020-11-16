import 'package:flutter/material.dart';

class CreateRecord extends StatefulWidget {
  final Function userData;

  CreateRecord(this.userData);

  @override
  _CreateRecordState createState() => _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecord> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void inputData() {
    final newTitleInput = titleController.text;
    final newAmountInput = double.parse(amountController.text);

    if(newTitleInput.isEmpty || newAmountInput <= 0) {
        return;
    }

    widget.userData(
      newTitleInput,
      newAmountInput,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => inputData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => inputData,
            ),
            FlatButton(
              onPressed: inputData,
              child: Text('Add Record'),
            )
          ],
        ),
      ),
    );
  }
}
