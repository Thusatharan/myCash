import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './expenses.dart';

class ShowExpenses extends StatelessWidget {
  final List<Expenses> userExpenses;
  final Function deleteEx;
  ShowExpenses(this.userExpenses, this.deleteEx);

  @override
  Widget build(BuildContext context) {
    return (userExpenses.isEmpty)
        ? Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Image.asset('assets/images/paper_pen.png'),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'No Record Found, Add Something',
                    style: TextStyle(fontSize: 20, color: Colors.redAccent),
                  ),
                )
              ],
            ))
        : Container(
            child: ListView.builder(
              itemBuilder: (itm, index) {
                return Card(
                  color: Theme.of(context).cardColor,
                  elevation: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ),
                      IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.redAccent,
                          onPressed: () => deleteEx(userExpenses[index].id))
                    ],
                  ),
                );
              },
              itemCount: userExpenses.length,
            ),
          );
  }
}
