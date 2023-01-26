import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

void answerQuestion() {
  print("Answer choosen");
}

  @override
  Widget build(BuildContext context) {
    var questions = [
      "what is your favorite color?",
      "What is your favorite animal?",
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: Column(
            children: <Widget>[
              Text("This question!"),
              ElevatedButton(child: Text("Answer1"), onPressed: answerQuestion),
              ElevatedButton(child: Text("Answer2"), onPressed: answerQuestion),
              ElevatedButton(child: Text("Answer3"), onPressed: answerQuestion),
            ],
          )),
    );
  }
}
