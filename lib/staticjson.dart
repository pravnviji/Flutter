import 'dart:developer';
import 'dart:async';
import 'dart:convert';

import 'package:NewFlutterApp/HexColor.dart';
import 'package:NewFlutterApp/model/EmployeeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:NewFlutterApp/model/StudentModel.dart';
import 'package:http/http.dart' as http;

class StaticJson extends StatefulWidget {
  StaticJson({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StaticJson createState() => _StaticJson();
}

class _StaticJson extends State<StaticJson> {
  final ScrollController _scrollController = new ScrollController();
  Future<EmployeeModel> employeeDetails;
  List<StudentModel> student;

  @override
  void initState() {
    super.initState();
    _loadStudent();
  //  employeeDetails = _getEmployeeDetails();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: 

            Wrap(
              direction:Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing:10.0,
              runSpacing: 20.0,
              children: [
                new Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: Text("Static Json Example with Student Data",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          color: HexColor('#3CB371'))),
                ),
                new Container(
                  width: 200,
                  height: 300, 
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: (student != null)
                        ? ListView.builder(
                            itemCount: student.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(student[index].studentName),
                                  subtitle: Text("Score -- " +
                                      student[index].studentScores.toString()));
                            })
                        : new Text('No record found'),
                  ),
                )/*,
                new Container(
                  width:200,
                  height:300,
                 child: projectWidget(),
                )*/
              ],
            )// This trailing comma makes auto-formatting nicer for build methods.
        );
  }

Future<EmployeeModel> _getEmployeeDetails() async {
  print('---getEmployeeDetails---');
   final response = await http.get('http://dummy.restapiexample.com/api/v1/employees');
  if (response.statusCode == 200) {
    debugger();
    var jsonResult = json.decode(response.body);
    debugger();
    return EmployeeModel.fromJson(jsonResult['data']);
  } 
}

Widget projectWidget() {
  return FutureBuilder(
   future: employeeDetails,
   builder: (context, snapshot) {
    if (snapshot.hasData) {
      return  ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              
                                debugger();
                              return ListTile(
                                  title: Text(snapshot.data.name));
                            });
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
   },
  );
}

  Future<String> _loadStudentAsset() async {
    return await rootBundle.loadString('../assets/mock/Student.json');
  }

  void _loadStudent() {
    _loadStudentAsset().then((response) {
      setState(() {
        Iterable list = json.decode(response);
        student = list.map((model) => StudentModel.fromJson(model)).toList();
      });
    });
  }
}
