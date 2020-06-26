import 'package:flutter/material.dart';
import 'HexColor.dart';

class Question extends StatelessWidget {
  final String questionIndex;
  Question(this.questionIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,50,0,50),
      child: Text(
        questionIndex,
        style: TextStyle(
            fontSize: 53, fontFamily: 'Arial', color: HexColor('#88b74093')),
      ),
    );
  }
}
