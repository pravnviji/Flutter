import 'package:flutter/material.dart';
import 'package:NewFlutterApp/question.dart';
import 'package:NewFlutterApp/button.dart';

class QuizPage extends StatelessWidget {

    QuizPage(
      {
      @required this.questionIndex,
      @required this.question,
      @required this.btnHandler});

  final int questionIndex;
  final List<Map<String,Object>> question;
  final Function btnHandler;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Column(children: <Widget>[
      Question(
        question[questionIndex]['question'],
      ),
      Container(
        //  width: double.infinity,
        child: Column(children: <Widget>[
          ...(question[questionIndex]['answer'] as List<String>)
              .map((_answer) {
            return FancyButton(
                onPressedHandler: btnHandler,
                answerText: _answer);
          }).toList(),
        ]),
      ),
    ]);
  }
}
