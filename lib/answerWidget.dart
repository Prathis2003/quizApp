import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final questionAnswers;
  final incrementQuestionIndexFunction;
  final incrementScore;
  Answer(
      {this.incrementQuestionIndexFunction,
      this.questionAnswers,
      this.incrementScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: (questionAnswers['Option'] as List)
          .map(
            (e) => Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (e == questionAnswers['Answer']) {
                      incrementScore();
                    }
                    incrementQuestionIndexFunction();
                  },
                  child: Text(e.toString()),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
