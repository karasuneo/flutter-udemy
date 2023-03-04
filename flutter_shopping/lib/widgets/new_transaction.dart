import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/widgets/adaptive_flat_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('Constructor NewTransaction Widget');
  }

  @override
  State<NewTransaction> createState() {
    print('Constructor NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransaction Widget');
  }

  // @override
  // void initState() {
  //   print('initState Widget');
  //   super.initState();
  // }

  // @override
  // void didUpdateWidget(covariant NewTransaction oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  // }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount;

    try {
      enteredAmount = double.parse(_amountController.text);
    } catch (e) {
      return;
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedData) {
      if (pickedData == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                    onSubmitted: (_) => _submitData(),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            _selectedDate == null
                                ? 'No Date Chosen!'
                                : 'Pocked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                          ),
                        ),
                        AdaptiveFlatButton(
                            'Choose Date', () => _presentDatePicker())
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _submitData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.primary, // background
                      foregroundColor: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.color, // foreground
                    ),
                    child: const Text('Add Transaction'),
                  )
                ])),
      ),
    );
  }
}
