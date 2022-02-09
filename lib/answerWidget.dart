import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final questionAnswers;
  final incrementQuestionIndexFunction;
  final incrementScore;
  Answer(
      {this.incrementQuestionIndexFunction,
      this.questionAnswers,
      this.incrementScore});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool isAnswerClicked = false;
  String clickedAnswer = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: (widget.questionAnswers['Option'] as List)
          .map(
            (e) => Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    if (isAnswerClicked == false) {
                      setState(() {
                        isAnswerClicked = true;
                        clickedAnswer = e;
                      });
                      if (e == widget.questionAnswers['Answer']) {
                        widget.incrementScore();
                      }
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isAnswerClicked = false;
                          clickedAnswer = '';
                        });
                        widget.incrementQuestionIndexFunction();
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(e),
                      SizedBox(width: 20),
                      isAnswerClicked && e == widget.questionAnswers['Answer']
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Container(),
                      isAnswerClicked &&
                              e == clickedAnswer &&
                              clickedAnswer != widget.questionAnswers['Answer']
                          ? Icon(Icons.wrong_location, color: Colors.red)
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
