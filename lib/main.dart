import 'package:flutter/material.dart';

import 'package:quiz_app/Result.dart';
import 'Quiz.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var white = Colors.white;
var black = Colors.black;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  bool _isSwitches = false;
  int _num0 = 0, _num1 = 0, _num2 = 0;

  final List<Map<String, Object>> _question = [
    {
      "qusetionText": "What\'s your favourite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Yellow", "score": 20},
        {"text": "Blue", "score": 30},
        {"text": "White", "score": 40}
      ]
    },
    {
      "qusetionText": "What\'s your favourite animal?",
      "answers": [
        {"text": "Cats", "score": 10},
        {"text": "Elephants", "score": 20},
        {"text": "Birds", "score": 30},
        {"text": "Dogs", "score": 40}
      ]
    },
    {
      "qusetionText": "What\'s your favourite instructor?",
      "answers": [
        {"text": "Ahmed", "score": 10},
        {"text": "Hassan", "score": 20},
        {"text": "Yasser", "score": 30},
        {"text": "Mona", "score": 40}
      ]
    }
  ];

  void _resert() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _num0 = 0;
      _num1 = 0;
      _num2 = 0;
    });
  }

  void answerQuestion(score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
      if (_questionIndex == 0)
        _num0 = score;
      else if (_questionIndex == 1)
        _num1 = score;
      else if (_questionIndex == 2) _num2 = score;
    });
    print("$_questionIndex");
    print("$_totalScore");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App", style: TextStyle(color: white),),
          actions: [
            Switch(
              value: _isSwitches,
              onChanged: (value) {
                setState(() {
                  _isSwitches = value;
                  if(_isSwitches == true){black= Colors.white; white = Colors.black;}
                  if(_isSwitches == false){black= Colors.black; white = Colors.white;}
                });
                print(_isSwitches);
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            )
          ],
        ),
        body: Container(
          height: double.infinity,
            color: white,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resert, _totalScore)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_questionIndex == 0) _totalScore -= _num0;
            else if (_questionIndex == 1) _totalScore -= _num1;
            else if (_questionIndex == 2) _totalScore -= _num2;
            setState(() {
              if(_questionIndex!=0) _questionIndex--;
            });
            print("$_questionIndex");
            print("$_totalScore");
          },
          child: Icon(Icons.arrow_back, color: white, size: 40,),
        ),
      ),
    );
  }
}
