import 'package:flutter/material.dart';
import 'package:quiz_app/answerWidget.dart';
import 'package:quiz_app/questionWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionAnswer = [
    {
      'questionText': 'How many continents in the world ?',
      'Option': ['a.10', 'b.7', 'c.8', 'd.5'],
      'Answer': 'b.7'
    },
    {
      'questionText':
          'What is part of a database that holds only one type of information ?',
      'Option': ['a.Record', 'b.File', 'c.Field', 'd.Report'],
      'Answer': 'c.Field'
    },
    {
      'questionText':
          'Which company created the most used networking software in the 1980\'s ?',
      'Option': ['a.Sun', 'b.IBM', 'c.Microsoft', 'd.Novell'],
      'Answer': 'd.Novell'
    }
  ];
  int score = 0;
  void incrementScore() {
    setState(() {
      score++;
    });
  }

  int questionIndex = 0;
  void incrementQuestionIndex() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: (questionIndex == questionAnswer.length)
            ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Completed ! ',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your Score is $score',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            questionIndex = 0;
                            score = 0;
                          });
                        },
                        child: Text('Reset Quiz..'))
                  ],
                ),
            )
            : Column(
                children: [
                  QuestionCard(
                      questionAnswers: questionAnswer[questionIndex]
                          as Map<String, dynamic>),
                  Answer(
                      incrementQuestionIndexFunction: incrementQuestionIndex,
                      questionAnswers: questionAnswer[questionIndex],
                      incrementScore: incrementScore)
                ],
              ),
      ),
    );
  }
}
