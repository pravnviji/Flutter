import 'package:NewFlutterApp/model/EmployeeModel.dart';
import 'package:flutter/material.dart';

class UserFormResult extends StatelessWidget {
  final EmployeeModel employeeModel;

  UserFormResult({this.employeeModel});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(employeeModel.id, style: TextStyle(fontSize: 22)),
            Text(employeeModel.employeeName, style: TextStyle(fontSize: 22)),
            Text(employeeModel.employeeSalary, style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    ));
  }
}
