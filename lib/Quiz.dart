import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Questions.dart';
import 'main.dart';

class Quiz extends StatelessWidget {
  final List question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(this.question, this.questionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(question[questionIndex]["qusetionText"]),

        //mapping answer object
        ...(question[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          // 7wlna l lamda 3l4an 23raf 2b3at param or body
          return Answer(() => answerQuestion(answer["score"]), answer["text"]);
        }).toList()
      ],
    );
  }
}
