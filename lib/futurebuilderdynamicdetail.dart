import 'dart:math' as math;
import 'package:NewFlutterApp/utils/StateFulWrapper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FutureBuilderDynamicDetail extends StatelessWidget {
  final String employeeName, employeeAge, employeeSalary, id;
  Color _textColor;
  FutureBuilderDynamicDetail(
      {Key key,
      this.employeeName,
      this.employeeAge,
      this.employeeSalary,
      this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        _textColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0);
      },
      child: Container(
        width: 50,
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(children: <Widget>[
          Text(
            'Id - ' + this.id,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 16, fontFamily: 'Arial', color: _textColor),
          ),
          Text(
            'Name - ' + this.employeeName,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 16, fontFamily: 'Arial', color: _textColor),
          ),
          Text(
            'Age - ' + this.employeeAge,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 16, fontFamily: 'Arial', color: _textColor),
          ),
        ]),
      ),
    );
  }
}
