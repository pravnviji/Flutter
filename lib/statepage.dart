import 'package:NewFlutterApp/quiz.dart';
import 'package:flutter/material.dart';
import 'package:NewFlutterApp/result.dart';

class StatePage extends StatefulWidget {
  StatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatePage createState() => _StatePage();
}

class _StatePage extends State<StatePage> {
  int _questionIndex = 0;
  final _question = const [
    {
      'question': 'What are you doing ?',
      'answer': ['Coding', 'Sleeping', 'Playing']
    },
    {
      'question': 'Where are you staying ?',
      'answer': ['India', 'Malaysia', 'UK']
    },
    {
      'question': 'Which is your favourite sport ?',
      'answer': ['Cricket', 'Football', 'Badminton']
    }
  ];

  void _changeQuestion() {
    setState(() {
    _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: _questionIndex < _question.length
              ? QuizPage(
                  questionIndex: _questionIndex,
                  question: _question,
                  btnHandler: _changeQuestion)
              : ResultPage()
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
