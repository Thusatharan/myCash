import 'package:flutter/material.dart';

class CreateRecord extends StatelessWidget {
  final Function userData;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  CreateRecord(this.userData);



  void inputData() {
    final newTitleInput = titleController.text;
    final newAmountInput = double.parse(amountController.text);

    if(newTitleInput.isEmpty || newAmountInput <= 0) {
        return;
    }

    userData(
      newTitleInput,
      newAmountInput,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
