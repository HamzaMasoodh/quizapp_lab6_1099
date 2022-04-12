import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

Quiz quiz = Quiz();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Quiz App 1099',
    home: Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: QuizApp(),
    ),
  ));
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scorekeeper = [];
  void checkanswer(bool userpicker) {
    bool check = quiz.getCorrectAnswer();
    if (quiz.isFinished() == true) {
      Alert(
        context: context,
        title: 'Finshed',
        desc: 'Your quiz is fininshed',
      ).show();
      quiz.reset();
      scorekeeper = [];
    } else {
      if (check == userpicker) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      setState(() {
        quiz.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(
                  quiz.getQuestionText(),
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            )),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
            child: Container(
              color: Colors.green,
              child: TextButton(
                child: Center(
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  checkanswer(true);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: Center(
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  checkanswer(false);
                },
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
