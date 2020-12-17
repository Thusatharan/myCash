import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateRecord extends StatefulWidget {
  final Function userData;

  CreateRecord(this.userData);

  @override
  _CreateRecordState createState() => _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecord> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;

  void inputData() {
    final newTitleInput = titleController.text;
    final newAmountInput = double.parse(amountController.text);

    if (newTitleInput.isEmpty || newAmountInput <= 0 || selectedDate == null) {
      return;
    }

    widget.userData(
      newTitleInput,
      newAmountInput,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void recordDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((datePicker) {
      if (datePicker == null) {
        return;
      }
      setState(() {
        selectedDate = datePicker;
      });
    });
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
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text((selectedDate == null)
                        ? 'No date Choosen'
                        : 'Picked Date : ${DateFormat.yMd().format(selectedDate)}'),
                  ),
                  FlatButton(
                      onPressed: recordDatePicker,
                      textColor: Colors.amber,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal),
                      ))
                ],
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              textColor: Colors.white,
              onPressed: inputData,
              child: Text('Add Record'),
            )
          ],
        ),
      ),
    );
  }
}
