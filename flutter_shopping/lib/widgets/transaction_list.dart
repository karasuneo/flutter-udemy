import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction addes yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                          '\$${transactions[index].amount}',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.color),
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );

                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Theme.of(context).colorScheme.primary)),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transactions[index].amount}',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //               color: Theme.of(context).colorScheme.primary),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6,
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey, fontSize: 16),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
