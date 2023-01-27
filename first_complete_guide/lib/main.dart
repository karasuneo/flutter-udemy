import "package:flutter/material.dart";

import "./question.dart";
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print("Answer choosen");
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        "questionText": "What is your favorite color?",
        "answers": ["Black", "White", "Red", "Green"]
      },
      {
        "questionText": "What is your favorite animal?",
        "answers": ["Rabbit", "snake", "Cat", "Dog"]
      },
      {
        "questionText": "What is your favorite friend?",
        "answers": ["Max", "Max", "Max"]
      },
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: Column(
            children: <Widget>[
              Question(questions[_questionIndex]["questionText"] as String),

              ...(questions[_questionIndex]["answers"] as List<String>).map((answer) {
                return Answer(_answerQuestion,answer);
                }) .toList()
                
              
              
            ],
          ),
          ),
    );
  }
}
