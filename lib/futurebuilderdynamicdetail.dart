import 'package:flutter/material.dart';

class FutureBuilderDynamicDetail extends StatelessWidget {
  final String employeeName, employeeAge, employeeSalary, id;
  FutureBuilderDynamicDetail(
      {this.employeeName, this.employeeAge, this.employeeSalary, this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:50,
      height:30,
      margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 1.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2
        ),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(children: <Widget>[
        Text(
          'Id - $id',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Arial', color: Colors.red[400]),
        ),
        Text(
          'Name - $employeeName',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Arial', color: Colors.red[400]),
        ),
        Text(
            'Age - $employeeAge',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Arial', color: Colors.red[400]),
        ),
      ]),
    );
  }
}
