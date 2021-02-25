import 'package:flutter/material.dart';
import 'main.dart';

class Questions extends StatelessWidget {
  final String questionText;

  Questions(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 30,
            color: black,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
