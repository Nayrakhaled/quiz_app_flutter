
import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {

  final Function resert;
  final int answerScore;

  Result(this.resert, this.answerScore);

  String get resultPhrase{
    String result;
    if(answerScore >=70) result = "you are awesome !";
    else if(answerScore >=40) result = "pretty likable !";
    else result = "you are so bad !";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your score is $answerScore",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: black),
              textAlign: TextAlign.center,
            ),
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold,  color: black),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text("Resert the App", style: TextStyle(fontSize: 30 , color: Colors.blue),),
                onPressed: resert)
          ],
        ));
  }
}
