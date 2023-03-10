import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartHnadler;

  Result(this.resultScore, this.restartHnadler);

  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 8) {
      resultText = 'Tou are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: restartHnadler,
            child: Text('Restart Quiz!'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
