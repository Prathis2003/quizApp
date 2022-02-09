import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final questionAnswers;
  
  QuestionCard({this.questionAnswers});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/1.5;
    return Container(
      width: double.infinity,
      child: Text(questionAnswers['questionText'],
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
    );
  }
}
