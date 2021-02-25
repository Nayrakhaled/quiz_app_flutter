
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String answerText;
  final Function pressedFun;

  Answer(this.pressedFun, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText, style: TextStyle(fontSize: 25),),
        onPressed: pressedFun,
        textColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}
